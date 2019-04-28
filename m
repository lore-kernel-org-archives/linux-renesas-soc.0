Return-Path: <SRS0=70Oj=S6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B3AC43219
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 28 Apr 2019 20:19:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 132C82064A
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 28 Apr 2019 20:19:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="FHqy2dH1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbfD1UTR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 28 Apr 2019 16:19:17 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37728 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbfD1UTR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Apr 2019 16:19:17 -0400
Received: by mail-lf1-f65.google.com with SMTP id h126so6352799lfh.4
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Apr 2019 13:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TKheEK4Mvlr1iGnrml0cmF12fi/Fi51zMsruPqmifK8=;
        b=FHqy2dH13C2cb811s+ebifSwbh2zzFy/E028zX15qmDhprvenKspklamsCMgcGJy12
         54X8JJD44Icg0GqL/6VmilO2aSTxYk+dTjpKUZB/FiTnoilDvvj9MTGbnUkiD2UtZsDA
         m9Bqzya9r3ghmX4pq3JK68Y4czwZpQ8jdmTAfEZvaDXwSr3VlBEtWYEMIzJ/+xLHSzbD
         85AKsyTnz7zwuy43jWhb6Vc1m8ruq4Upi5tF8audgsmP2eFH+tSet2ouNsQqK/iSdHyn
         jFiN8FraWh5ZCvUYQO9l8ayL4fhaEsK0hntsLrFGZzbjvT5L1yJ8Kl/yRgPvs502GC/0
         tDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TKheEK4Mvlr1iGnrml0cmF12fi/Fi51zMsruPqmifK8=;
        b=C+NTmdDQO7ZtQdlmBFa0O+O/QUrowXGhS/o2YnHELRuxEZft2eXSRlde4v7Sk2GcsC
         KwNep78DPLXmpVfB951hXvs5eifbKnbzlEWNGA3ukjsNuzpL1rzw4utid4jbT25WmD7S
         RQKlPsvZSVI61FjYWenrhd4HlLtoQqshe1ctkJQkJUMOMCfCBmOee3X+s46srjBpVayL
         YdvlE53SyA1PLs9soXW9FSemkQL4Y/F9ic4OYwucbdKTnSCRCHzAcBEvlgncIsfxQICK
         IdZJFe8+7LmeO4Ud0dGfeorzuLR9m/8knesfvPhwbmoKpztE3p4Rr8pJ7zBVEn13UJrD
         Oq6g==
X-Gm-Message-State: APjAAAViOE6wr1XQhvAjGfY/OTtlxus1CNjSQyRQzkGwS4Uw3vlxYB32
        6/o1zPZiqtnVHE42vHNgTOj4Fg==
X-Google-Smtp-Source: APXvYqw+xkvTBDsZMcintk2dF+/MTmVgLca1WTLKcIw8qsfu3qHXt0oVSVTlbCP4D9CQz5sx+fj2uA==
X-Received: by 2002:a19:3f09:: with SMTP id m9mr29923580lfa.36.1556482755566;
        Sun, 28 Apr 2019 13:19:15 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id j13sm3200859lfb.34.2019.04.28.13.19.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 13:19:14 -0700 (PDT)
Date:   Sun, 28 Apr 2019 12:16:42 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC DT Updates for v5.2
Message-ID: <20190428191642.ifgz3fgmzrmfcnkt@localhost>
References: <cover.1554281697.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1554281697.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 03, 2019 at 12:53:48PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM64 based SoC DT updates for v5.2.
> 
> In keeping with similar early pull-requests for the past few release cycles
> I am sending this now as a number of patches have accumulated in this
> branch. I expect to send a follow-up pull-request closer to the usual rc6
> timing.
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt-for-v5.2
> 
> for you to fetch changes up to e3414b8c45afa5cdfb1ffd10f5334da3458c4aa5:
> 
>   arm64: dts: renesas: salvator-common: Add GPIO keys support (2019-03-27 13:02:12 +0100)

Thanks, merged!


-Olof
