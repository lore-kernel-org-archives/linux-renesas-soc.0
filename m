Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:32884 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933869AbcJTSpA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Oct 2016 14:45:00 -0400
Received: by mail-lf0-f54.google.com with SMTP id x79so103550867lff.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Oct 2016 11:44:59 -0700 (PDT)
Subject: Re: [PATCH v2] ARM: shmobile: Consolidate R8A7743 and R8A779[234]
 machine definitions
To: Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <1476712744-32619-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <20161020085804.GK4612@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4b407584-21d4-5dc7-6866-6feff12f302f@cogentembedded.com>
Date: Thu, 20 Oct 2016 21:44:56 +0300
MIME-Version: 1.0
In-Reply-To: <20161020085804.GK4612@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 10/20/2016 11:58 AM, Simon Horman wrote:

>> The four SoCs use identical machine operations, consolidate them into
>> two machine definitions in a single file.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> Tested-by: Simon Horman <horms+renesas@verge.net.au>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> Changes since v1:
>>
>> - Rebased on top of Simon's latest devel branch, thus including R8A7743
>>   consolidation
>>
>>  arch/arm/mach-shmobile/Makefile          |  4 ----
>>  arch/arm/mach-shmobile/setup-r8a7743.c   | 34 -------------------------------
>>  arch/arm/mach-shmobile/setup-r8a7792.c   | 35 --------------------------------
>>  arch/arm/mach-shmobile/setup-r8a7793.c   | 33 ------------------------------
>>  arch/arm/mach-shmobile/setup-r8a7794.c   | 33 ------------------------------
>>  arch/arm/mach-shmobile/setup-rcar-gen2.c | 33 ++++++++++++++++++++++++++++++
>>  6 files changed, 33 insertions(+), 139 deletions(-)
>>  delete mode 100644 arch/arm/mach-shmobile/setup-r8a7743.c
>>  delete mode 100644 arch/arm/mach-shmobile/setup-r8a7792.c
>>  delete mode 100644 arch/arm/mach-shmobile/setup-r8a7793.c
>>  delete mode 100644 arch/arm/mach-shmobile/setup-r8a7794.c
>
> Thanks for this Laurent, its a very nice diffstat.
> I have queued it up for v4.10.

    I'm not seeing a new devel tag when fetching... :-(

MBR, Sergei
