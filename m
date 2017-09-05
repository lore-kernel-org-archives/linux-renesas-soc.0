Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:32936 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751717AbdIEOd0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Sep 2017 10:33:26 -0400
Date: Tue, 5 Sep 2017 16:33:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Simon Horman <horms@verge.net.au>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL LTSI-4.9 v2 00/13] Second Round of Renesas SoCs and
 Drivers to v4.12
Message-ID: <20170905143327.GA12405@kroah.com>
References: <1504598808-19810-1-git-send-email-horms@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1504598808-19810-1-git-send-email-horms@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 05, 2017 at 10:06:35AM +0200, Simon Horman wrote:
> Hi,
> 
> This is a submission to LTSI-v4.9.
> 
> * Backport v4.9 of the rcar-gen3-thermal driver to its as of v4.12.
> * Limited backport to v4.9 of:
>   - usb core
>   - ohci-platform
>   - ehci-platform
>   - cs2000
> 
> There are 13 patches.
> 
> This patches appear to apply ltsi-4.9 tree generated using
> scripts/generate_git.

Thanks, that worked just fine, all now queued up.

greg k-h
