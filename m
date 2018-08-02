Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48836 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387404AbeHBOXj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Aug 2018 10:23:39 -0400
Date: Thu, 2 Aug 2018 14:32:37 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "ltsi-dev@lists.linuxfoundation.org"
        <ltsi-dev@lists.linuxfoundation.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [LTSI-dev] [GIT/RFC PULL LTSI-4.14] Renesas SoCs and Drivers to
 v4.18-rc6
Message-ID: <20180802123237.gjkoo2v7fzuolobz@verge.net.au>
References: <20180725152244.fykhouzwpr5mmlpy@verge.net.au>
 <OSBPR01MB229369195BC8BCF078F47CAFD82C0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB229369195BC8BCF078F47CAFD82C0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 02, 2018 at 05:36:00AM +0000, Yoshihiro Shimoda wrote:
> Hi Simon-san,
> 
> > From: Simon Horman, Sent: Thursday, July 26, 2018 12:23 AM
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git
> > backport/v4.14.57/snapshot-to-v4.18-rc6+fixes-flattened
> 
> Our test team found that the kernel image could not probe the gpio-pca953x driver
> because the following commit was missing in the branch:
> 
> ----
> commit 8a64e557f399090f5d1917b2f32a065da2b12be1
> Author: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Date:   Thu Nov 16 23:18:32 2017 +0300
> 
>     gpio: pca953x: fix vendor prefix for PCA9654
> ----
> 
> So, would you backport the commit?

Sure, will do.
