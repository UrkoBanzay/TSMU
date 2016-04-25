read -p "add host to dns y/N: " add_to_dns
add_to_dns=${add_to_dns:-N}
echo "$add_to_dns"
            if [ "$add_to_dns" = "y" ]; then
               echo expression evaluated as true
            fi

