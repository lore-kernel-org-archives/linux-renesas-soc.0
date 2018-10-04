Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp1.de.adit-jv.com ([62.225.105.245]:56903 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727662AbeJDVlq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Oct 2018 17:41:46 -0400
Date: Thu, 4 Oct 2018 16:47:56 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: <linux-i2c@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: Re: [PATCH 1/2] i2c: rcar: refactor private flags
Message-ID: <20181004144756.GB25176@vmlxhi-102.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180808075928.31107-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

> On August 8, 2018 at 9:59 AM Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> 
> Use BIT macro to avoid shift-31-problem, 

May I ask how exactly you spotted the "shift-31-problem" in
drivers/i2c/busses/i2c-rcar.c:
 - visual code review?
 - static analysis, special compiler flags?
 - run-time testing with UBSAN=y?

The background of my question is seeing a lot of UBSAN errors caused
by (1 << 31) in U-Boot with UBSAN=y [1]. Based on my experiments, the
Linux UBSAN simply doesn't complain about (1 << 31). I traced the
difference to be caused by the -std=gnu{89,11} value passed to gcc,
which varies between U-Boot and Linux.

According to feedback from GCC community [2], with 'gcc -std=gnu89',
shifting into (not past) the sign bit is "defined behavior" which is why
UBSAN doesn't report this as an issue in Linux kernel. That makes me
curious about the background of this patch, since it might shed some
light onto how to further handle the (1 << 31) UBSAN warnings in
U-Boot.

Thank you very much for your feedback.

[1] https://patchwork.ozlabs.org/cover/962307/
[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=87392

Best regards,
Eugeniu.
