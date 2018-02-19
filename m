Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:32955 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753217AbeBSRrx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Feb 2018 12:47:53 -0500
Date: Mon, 19 Feb 2018 18:47:48 +0100
From: Simon Horman <horms@verge.net.au>
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        kbuild-all@01.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [renesas:soc-for-v4.17 6/6]
 drivers/soc/renesas/r8a77980-sysc.c:12:10: fatal error:
 dt-bindings/power/r8a77980-sysc.h: No such file or directory
Message-ID: <20180219174745.gxvdpgceejctbwei@verge.net.au>
References: <201802200054.GAzdclOv%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201802200054.GAzdclOv%fengguang.wu@intel.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 20, 2018 at 12:02:58AM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git soc-for-v4.17
> head:   8b49a80541c565d5d8482f15350ab861f60455a1
> commit: 8b49a80541c565d5d8482f15350ab861f60455a1 [6/6] soc: renesas: rcar-sysc: add R8A77980 support
> config: i386-allmodconfig (attached as .config)
> compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
> reproduce:
>         git checkout 8b49a80541c565d5d8482f15350ab861f60455a1
>         # save the attached .config to linux build tree
>         make ARCH=i386 
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/soc/renesas/r8a77980-sysc.c:12:10: fatal error: dt-bindings/power/r8a77980-sysc.h: No such file or directory
>     #include <dt-bindings/power/r8a77980-sysc.h>
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    compilation terminated.
> 
> vim +12 drivers/soc/renesas/r8a77980-sysc.c
> 
>     11	
>   > 12	#include <dt-bindings/power/r8a77980-sysc.h>
>     13	

Ooops. I missed that

8b49a80541c5 ("soc: renesas: rcar-sysc: add R8A77980 support")

depends on

eaf8509d3d97 ("dt-bindings: power: add R8A77980 SYSC power domain definitions")

Perhaps I should just squash the latter into the former.

Sergei, Geert, any thoughts?
