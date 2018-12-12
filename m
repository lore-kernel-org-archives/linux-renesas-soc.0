Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F6CC6783B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 22:16:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A19622087F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 22:16:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="Kn6ucBRl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A19622087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbeLLWQk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Dec 2018 17:16:40 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36015 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbeLLWQj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Dec 2018 17:16:39 -0500
Received: by mail-lj1-f196.google.com with SMTP id g11-v6so15874ljk.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Dec 2018 14:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=orbEWziUbS64BSz/Mp/03FgCpKYpUEld21UVBjMEC70=;
        b=Kn6ucBRlxeDV09+GPFqiN+S0HprJH7OJ1/W3fttfdlmFf6n9PFSK69HDdCQ6d02FLg
         IZ8Xk9xjEBco9bnnSQXxoWx4OY9155OArM+ED7hfirwkYg/neJFvuhQOHX46OyglZ2GX
         OgiGhJfq7pxtLJsBdyc+cbiZeGaEBJsn08Qt/CR/Dbx8a+WeVXGyGC65Ow5ycQo16MD3
         ovByFBqP88UUjy3CnTMc2irznYNhfkxyaGoKpLwNdy7jwIrCOwmLYJLdYV7IcgBBNCQU
         MeARMqgxM/3BxaBGq48T7GxpckVzbEsc1lOh1SbtMUmE5LYJslnZeg5Ip+ApcI6qm4z0
         /VxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=orbEWziUbS64BSz/Mp/03FgCpKYpUEld21UVBjMEC70=;
        b=nuL1valUStwBaedznYEDHfjVIaQ5vBhHBB/Hu6cevIpdQbeDpyR1Ae99xG9SAH4bkM
         t86UY9KkNIIFwrGFMFUXfj6qubDYE94gbdjACSyzWKmjmWX8O6fwNC5k30moSY0a1DKh
         VYavrHs4MjQyChx7Azz1KXNcKU3bRGccIOZcHPis0UrzW8K3+/yju+D5SCHIHojdTmpR
         ZLopN2jndAAQXKDCx+S+JC2AhHmsIA0mmYIL+6OFqwk7Yo00ocwI8tJDm+BFOycvpI0p
         hxoQiV+eLCcoM/LnzfDwQ4UFhDVhrKjA2JAMkKoUZ72ucOTmB9DgpBZOoaFenKbdxzv0
         zNng==
X-Gm-Message-State: AA+aEWaXavqh2Qmbsg09AIlubJBCk5XjJP5qeXsNtCBO0yS+GkRdq/tJ
        ezwziDIRwUx/S3wcu/xdZxm5TQ==
X-Google-Smtp-Source: AFSGD/W9eKGZKl+x2aNo8/0uw6QLbpLSZyCdkwk4326YP5vX65IShv5DPkPkJFy0obANFut/9ucDJQ==
X-Received: by 2002:a2e:2f15:: with SMTP id v21-v6mr13383766ljv.56.1544652997799;
        Wed, 12 Dec 2018 14:16:37 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id x11sm210lfd.81.2018.12.12.14.16.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Dec 2018 14:16:35 -0800 (PST)
Date:   Wed, 12 Dec 2018 13:50:28 -0800
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Updates for v4.21
Message-ID: <20181212215028.q4pcih4htgskg3fq@localhost>
References: <cover.1544132474.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1544132474.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 06, 2018 at 01:59:31PM -0800, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC updates for v4.21.
> 
> 
> Usually I separate SoC changes for ARM and arm64 into separate branches.
> On this occasion I have applied them to a single branch and pull request.
> The reason for this is that moving SoC Konfig symbols for both ARM and
> arm64 creates a dependency and a combined branch is a clean way to resolve
> this.
> 
> If separate branches are required then I propose deferring the movement
> of ARM (but not arm64) SoC Kconfig symbols to v4.22.
> 
> 
> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:
> 
>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-soc-for-v4.21
> 
> for you to fetch changes up to 2ed29e15e4b2500ae78de658a18f4482e7ac288b:
> 
>   ARM: shmobile: R-Mobile: Move pm-rmobile to drivers/soc/renesas/ (2018-11-30 11:29:11 +0100)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC Updates for v4.21
> 
> * pm-rmobile driver
>   - Move to drivers/soc/renesas/
>   - Clean up struct rmobile_pm_domain
> * Renesas SoC Kconfig Symbols
>   - Move symbols for ARM and SoCs to drivers/soc/renesas/
>   - Hide ARCH_RZN1 to improve consistency
> * SH-Mobile AG5 (sh73a0) SoC: Remove obsolete inclusion of <asm/smp_twd.h>
> * Restrict TWD and SCU to Renesas ARM based SoCs where they are present
> * Enable GPIOLIB on Renesas arm64 based SoCs to allow GPIO driver selection

Thanks, merged into next/soc now.


-Olof
