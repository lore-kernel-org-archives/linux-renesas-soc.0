Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 24 Feb 2017 18:12:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Matthew Giassa <matthew@giassa.net>
Cc: wsa@the-dreams.de, linux-renesas-soc@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] Checkpatch fixes for staging/drivers/ks7010.
Message-ID: <20170224171257.GC14009@kroah.com>
References: <1487650805-30520-1-git-send-email-matthew@giassa.net>
 <1487800378-22557-1-git-send-email-matthew@giassa.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1487800378-22557-1-git-send-email-matthew@giassa.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Feb 22, 2017 at 01:52:58PM -0800, Matthew Giassa wrote:
> Wrapping complex macros with parentheses.
> Adding extra spaces between macros and integer literals.
> Indentation changes to remove checkpatch warnings.
> Swapping out C++-style comments with C-style comments.
> 
> Signed-off-by: Matthew Giassa <matthew@giassa.net>
> ---
>  drivers/staging/ks7010/ks_wlan_ioctl.h | 74 +++++++++++++++++-----------------
>  1 file changed, 37 insertions(+), 37 deletions(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
