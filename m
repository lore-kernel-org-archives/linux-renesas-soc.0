Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 17 Mar 2017 15:22:57 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Matthew Giassa <matthew@giassa.net>
Cc: wsa@the-dreams.de, linux-renesas-soc@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv5 1/4] Staging: ks7010: ks_wlan_ioctl.h: Removed mixed
 spaces/tabs
Message-ID: <20170317062257.GA7745@kroah.com>
References: <20170316024246.GA19641@kroah.com>
 <1489634291-30028-1-git-send-email-matthew@giassa.net>
 <1489634291-30028-2-git-send-email-matthew@giassa.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1489634291-30028-2-git-send-email-matthew@giassa.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Mar 15, 2017 at 08:18:08PM -0700, Matthew Giassa wrote:
> Removing mixed spaces/hard-tabs used to create a "column alignment" of
> macro names and macro values.
> 
> Signed-off-by: Matthew Giassa <matthew@giassa.net>
> ---
>  drivers/staging/ks7010/ks_wlan_ioctl.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

This patch does not apply to my tree at all.  Are you sure you are
working against the staging-next branch?  Please rebase and resend.

thanks,

greg k-h
