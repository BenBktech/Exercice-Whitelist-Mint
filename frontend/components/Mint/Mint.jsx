'use client'

import { useAccount, usePrepareContractWrite, useContractWrite, useWaitForTransaction } from "wagmi"

import { formatEther, parseEther } from "viem"

import { Button, Text, Flex, useToast } from "@chakra-ui/react"

import { contractAddress, abi, whitelisted } from "@/constants"

import { MerkleTree } from 'merkletreejs'

import keccak256 from "keccak256";

import { useState, useEffect } from "react"

const Mint = () => {

    const toast = useToast()

    const [proof, setProof] = useState([])

    const { address, isConnected } = useAccount()

    // Mint 
    // Prepare the transaction
    const { config: configMint } = usePrepareContractWrite({
        address: contractAddress,
        abi: abi,
        functionName: 'whitelistMint',
        args: //!\ A COMPLETER /!\,
        value: //!\ A COMPLETER /!\,
        enabled: //!\ A COMPLETER /!\,
        account: //!\ A COMPLETER /!\,
        onError(e) {
            toast({
                title: 'Error.',
                description: 'Are you whitelisted ?',
                status: 'error',
                duration: 4000,
                isClosable: true,
            })
        },
        onSuccess() {
            console.log('Preparing Mint...')
        }
    });

    // Get the write function
    const { data: dataMint, write: writeMint, error: mintWriteError } = useContractWrite(configMint)

    const { isLoading: isLoadingMint, isSuccess: isSuccessMint } = useWaitForTransaction({
        hash: dataMint?.hash,
        async onSuccess(dataMint) {
            toast({
                title: 'Congratulations.',
                description: "Mint was successfull.",
                status: 'success',
                duration: 4000,
                isClosable: true,
            })
        },
        onError() {
            console.log('erreur');
        }
    })

    useEffect(() => {
        if(isConnected) {
            // Génération de la Merkle Proof
            //!\ A COMPLETER /!\
            let proof = tree.getHexProof(leaf);
            setProof(proof);
        }
    }, [address])

    return (
        <Flex
            alignItems="center"
            justifyContent="center"
            height="85vh"
            width="100%"
        >
            {isConnected ? (
                <Button disabled={!writeMint || isLoadingMint} colorScheme='whatsapp' onClick={() => writeMint?.()}>{isLoadingMint ? 'Minting...' : 'Mint'}</Button>
            ) : (
                <Text>Please connect your Wallet to our DApp.</Text>
            )}
            
        </Flex>
    )
}

export default Mint