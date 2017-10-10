Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:53420 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751398AbdJJJZp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 05:25:45 -0400
Received: by mail-lf0-f43.google.com with SMTP id l23so23372479lfk.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Oct 2017 02:25:44 -0700 (PDT)
Subject: Re: [PATCH] ARM: shmobile: rcar-gen2: fix non-SMP build
To: Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>
References: <cover.1507623048.git.horms+renesas@verge.net.au>
 <dc15ca962757ca72a4492b2e13be2eecc6dcd716.1507623048.git.horms+renesas@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <44e29d14-b0f7-9454-4cf9-ee175fa078dd@cogentembedded.com>
Date: Tue, 10 Oct 2017 12:25:42 +0300
MIME-Version: 1.0
In-Reply-To: <dc15ca962757ca72a4492b2e13be2eecc6dcd716.1507623048.git.horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 10/10/2017 11:12 AM, Simon Horman wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> A bugfix for the SMP case broke the build for the UP case:
> 
> arch/arm/mach-shmobile/headsmp-apmu.o: In function `shmobile_boot_apmu':
> (.text+0x34): undefined reference to `secondary_startup'
> 
> The assembler file mixes code that is used for SMP with code
> that we also need on a single-CPU build, so I'm leaving it
> always enabled in the Makefile, but enclose the SMP code
> in an #ifdef.
> 
> 3fd45a136ff6 ("ARM: shmobile: rcar-gen2: Make sure CNTVOFF is initialized on CA7/15")

    "Fixes:"?

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]

MBR, Sergei
