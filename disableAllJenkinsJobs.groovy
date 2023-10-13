// Console script

import hudson.model.*
 
 
disableChildren(Hudson.instance.items)
 
def disableChildren(items) {
  for (item in items) {
    if (item.class.canonicalName == 'com.cloudbees.hudson.plugins.folder.Folder') {
        disableChildren(((com.cloudbees.hudson.plugins.folder.Folder) item).getItems())
    } else {
      item.disabled=true
      item.save()
      println(item.name)
    }
  }
}

// This also has all information

def creds = com.cloudbees.plugins.credentials.CredentialsProvider.lookupCredentials( com.cloudbees.plugins.credentials.Credentials.class, Jenkins.instance, null, null );

for (c in creds) {
   println(c.id + ": " + c.description)
   c.properties.each { println it }
   println()
   println()
}