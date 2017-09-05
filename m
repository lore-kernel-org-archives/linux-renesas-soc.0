Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:42214 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751296AbdIEHea (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Sep 2017 03:34:30 -0400
Date: Tue, 5 Sep 2017 09:34:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Simon Horman <horms@verge.net.au>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [LTSI-dev] [GIT PULL LTSI-4.9] Second Round of Renesas SoCs and
 Drivers to v4.12
Message-ID: <20170905073431.GC17948@kroah.com>
References: <20170829190853.GA4714@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170829190853.GA4714@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 29, 2017 at 09:08:53PM +0200, Simon Horman wrote:
> Hi,
> 
> This is a submission to LTSI-v4.9.
> 
> This series is comprised of a backport v4.9 of the rcar-gen3-thermal driver
> to its as of v4.12. This was unintentionally omitted from earlier work
> submitted for inclusion in LTSI-4.9.
> 
> There are 9 patches.
> 
> This is based on a merge of:
> * Earlier work posted as
>   "[GIT PULL LTSI-4.9] Renesas SoCs and Drivers to v4.12"
>   and is tagged as tags/backport/v4.9.36/snapshot-to-v4.12-flattened
> * v4.9.45
> 
> It appears to apply cleanly to an ltsi-4.9 tree generated using
> scripts/generate_git
> 
> 
> The following changes since commit 89dcb9ecf2d34cba6cba23376651476b0273db5d:
> 
>   Merge tag 'v4.9.45' into backport/v4.9.45/snapshot-flattened (2017-08-29 20:34:36 +0200)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git tags/backport/v4.9.45/snapshot2-to-v4.12-flattened

Hm, I tried to pull this, based on your previous patch, but I get a
merge error:

$ git branch -v
  linux-4.9.y efcfbfb1d8bf Linux 4.9.40
  n1          e3eea6cb6b2f Merge tag 'socfpga_updates_for_v4.9-ltsi' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into n1
  s1          410f9f76e434 Merge tag 'backport/v4.9.36/snapshot-to-v4.10-flattened' of https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport into s1
  s2          456eeea5eefc Merge tag 'backport/v4.9.36/snapshot-to-v4.11-flattened' of https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport into s2
  s3          a896e47351b4 Merge tag 'backport/v4.9.36/snapshot-to-v4.12-flattened' of https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport into s3
* s4          a896e47351b4 Merge tag 'backport/v4.9.36/snapshot-to-v4.12-flattened' of https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport into s3
$ git pull   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git tags/backport/v4.9.45/snapshot2-to-v4.12-flattened
>From https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport
 * tag                         backport/v4.9.45/snapshot2-to-v4.12-flattened -> FETCH_HEAD
Auto-merging drivers/pinctrl/sh-pfc/pfc-r8a7795.c
CONFLICT (content): Merge conflict in drivers/pinctrl/sh-pfc/pfc-r8a7795.c
Auto-merging arch/x86/platform/intel-mid/device_libs/platform_mrfld_spidev.c
Automatic merge failed; fix conflicts and then commit the result.
$

What am I doing wrong here?

confused,

greg k-h
