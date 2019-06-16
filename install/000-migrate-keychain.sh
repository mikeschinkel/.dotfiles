#!/usr/bin/env bash
#
# See 
#
open "https://library.panic.com/general/keychain-migration/"

# If no longer there:
# 
# Syncing your site passwords and keys from one Mac to another using Panic Sync is easy– just enable it and you’re golden. If you don’t want to use Panic Sync, you’ll need to move your passwords manually. Transmit and Coda store these in your Login keychain.
# 
# Migrating your Keychain
# -----------------------
# If you migrate your data to a new Mac using the Setup Assistant, your keychains will automatically be transferred to the new computer. To manually move your keychains to another Mac, you can copy your keychain file to the other computer and import it with Keychain Access.
# 
# Important: Be sure not to leave your keychain on a computer that is not secure. Doing so may allow other users to access items with your keychain.
# 
# 1. In the Finder, locate the keychain file you want to transfer. Keychains are usually located in the Keychains folder in the Library folder in your home folder.
# 
# 2. Choose Go > Go to Folder.
# 
# 3. Enter ~/Library/Keychains and click Go.
# 
# 4. In the folder that appears, find the file called login.keychain and move it to the same place on your other Mac.
# 
# 5. Change the name of the keychain file on your new computer so it doesn’t become confused with any of the existing keychains. Something like login2.keychain is fine.
# 
# 6. Open Keychain Access, located in /Applications/Utilities.
# 
# 7. Choose File > Add Keychain.
# 
# 8. Select your keychain, then click OK. You’ll need to provide the same password you used for the keychain on the previous computer. Keychain Access will can now access all the items on the keychain from your previous computer.