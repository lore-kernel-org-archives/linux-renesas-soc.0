Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:47512 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750980AbdCQGcU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2017 02:32:20 -0400
Date: Fri, 17 Mar 2017 15:23:18 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Matthew Giassa <matthew@giassa.net>
Cc: wsa@the-dreams.de, linux-renesas-soc@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv5 1/4] Staging: ks7010: ks_wlan_ioctl.h: Removed mixed
 spaces/tabs
Message-ID: <20170317062318.GA7930@kroah.com>
References: <20170316024246.GA19641@kroah.com>
 <1489634291-30028-1-git-send-email-matthew@giassa.net>
 <1489634291-30028-2-git-send-email-matthew@giassa.net>
 <20170317062257.GA7745@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170317062257.GA7745@kroah.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Mar 17, 2017 at 03:22:57PM +0900, Greg KH wrote:
> On Wed, Mar 15, 2017 at 08:18:08PM -0700, Matthew Giassa wrote:
> > Removing mixed spaces/hard-tabs used to create a "column alignment" of
> > macro names and macro values.
> > 
> > Signed-off-by: Matthew Giassa <matthew@giassa.net>
> > ---
> >  drivers/staging/ks7010/ks_wlan_ioctl.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> This patch does not apply to my tree at all.  Are you sure you are
> working against the staging-next branch?  Please rebase and resend.

Same thing for all of the patches in this series.

greg k-h
