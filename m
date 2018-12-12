Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903E4C65BAF
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 22:15:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52B582084E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 22:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="MLr7LKhf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52B582084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbeLLWP3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Dec 2018 17:15:29 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38869 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbeLLWP3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Dec 2018 17:15:29 -0500
Received: by mail-lf1-f67.google.com with SMTP id p86so4715lfg.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Dec 2018 14:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1KyGI9LStunnpguDkO9wmoWiiYzCYpnJ2Tz2WLigC+k=;
        b=MLr7LKhfLsvZ/yhXhzL3l2H7xKFsIA3Vr9AnpOqX0NNyOvem+V3jYXQx9/lt6AuXAx
         lPhcd64J+h3WhtDSyOHUVNyOe7yFaQGIeKOXamw7qRMaY8g8cZd9ZLBnRfxNqV1Be0RR
         JjVX6gaTy3qQ8Sn8z4yPbAGYN0eRzSW9nlRJdu3lx7AS6MuqDWenz2T8p2CtRPtH+tBU
         tWTrw9M0/fTl1SLybNNwpUA0uWo8PhKRvmWlEUhQAuvXVDEX+e/ML9Te1YFEvwtqAh/n
         c9ZqPsnNWkKRtReRGAu/7y4BG23EPWyMb4RbLDOSEpcUgbFhEzR48hBaQTeaOCheuJxh
         x3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1KyGI9LStunnpguDkO9wmoWiiYzCYpnJ2Tz2WLigC+k=;
        b=q+vf7VLhLoLIQguA4DAprg19YKKPHToO2IheNG0ARk+1UyZ1arGpq04XGDL5dMB4ja
         SazRY8+pW1+vrVJYREH6tUduR/z4Vtt7rbq43TssYI/sLACSHj62n5rHIBKaOpmp3gnd
         XUgpF3J4peJNyDrWLDhUXyNslGV5POaauE6JGtyKJpmDG91PKwMwRzWNrEQyBa6/Jr/o
         ZY5C0z8XjwnexG8p4eS0QKxFhQKUhKgKPTMu6lb0EVRcaTzVn3zqn9k/KfBNkOL7vGt1
         udHBuV22BKrrNV7931J6jodBnMbuqlARyciFWoGpLbliEeU/qYJuQCoue9/FjBMzZRpl
         Nm8w==
X-Gm-Message-State: AA+aEWY2pvzY5NDlXrBVv81AMRk8SqsmGYXmWuppjIW2ju/9unwawstg
        EEWBVi6KVz5Bj74bG3o1pktpGQ==
X-Google-Smtp-Source: AFSGD/VmXOOdT0M8CUvep+PZrPN0yPLegBc4gycbqo6o/tkS6yb074zn3VyZcFi/L5aPZRTdJRyBIg==
X-Received: by 2002:a19:a149:: with SMTP id k70mr12741530lfe.5.1544652927498;
        Wed, 12 Dec 2018 14:15:27 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id o25sm3387lfd.29.2018.12.12.14.15.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Dec 2018 14:15:24 -0800 (PST)
Date:   Wed, 12 Dec 2018 13:27:50 -0800
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Drivers Updates for v4.21
Message-ID: <20181212212750.aojzs2rzrnfnhnkr@localhost>
References: <cover.1544131943.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1544131943.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 06, 2018 at 01:58:53PM -0800, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC drivers updates for v4.21.
> 
> 
> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:
> 
>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-drivers-for-v4.21
> 
> for you to fetch changes up to 7fc4650cc2417d7a2907a000f6f88240baa42018:
> 
>   soc: renesas: rcar-sysc: Fix power domain control after system resume (2018-12-06 12:10:10 -0800)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC Drivers Updates for v4.21
> 
> SYSC Driver:
> * Common
>   - Fix power domain control after system resume
>   - Merge PM Domain registration and linking
>   - Remove rcar_sysc_power_{down,up}() helpers
> * R-Car E3 (r8a77990) SoC
>   - Fix initialization order of 3DG-{A,B}
> * R-Car V3H (r8a77980) SoC
>   - Correct A3VIP[012] power domain hierarchy
>   - Correct names of A2DP[01] power domains
> * R-Car V3M (r8a77970) SoC
>   - Correct names of A2DP/A2CN power domains
>   - emove non-existent CR7 power domain
> * R-Car M3-N (r8a77965) SoC
>   - Remove non-existent A3IR power domain


Merged, thanks!


-Olof
