Return-Path: <SRS0=U1Jq=PV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBD1C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 13 Jan 2019 06:10:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8202E20879
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 13 Jan 2019 06:10:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="O3RSe09O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbfAMGKo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 13 Jan 2019 01:10:44 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45982 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725863AbfAMGKn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Jan 2019 01:10:43 -0500
Received: by mail-lj1-f196.google.com with SMTP id s5-v6so16233319ljd.12
        for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Jan 2019 22:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/kRPs5LqgdzmQ9znT+M1ht3yniBXMbgvLe/e8Y16bA4=;
        b=O3RSe09OrdiQV+1kGFh3IufObEgZM2WP3Qt+FQzIm2gwRMQxUyXVReaHie+LFlsd0e
         2sobDyTn61ne4qJE7zIdhTZ3SjS70/yu0NIsILLS+Y8TwIUeToibB8nDMqB4wH1DK0FB
         cru95hoFdmF4aOPSaJJlcSTHcGfebQhC7kWCQ3DsJdElVX58rPCXndj4NNeQ3T4bp77Z
         /jcLx9IaoxVC6AtjkRmKsS654Vk9Oz95WTaIpha2m2yny0SZAUNy9KnKTkuP3U2UQKuF
         MZomik7nWE2hAZGG6VKhheSgdoLUwhhYeU21Uo2kUYk+fso9+YJgmWRAlHzqCsc1yX3R
         WTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/kRPs5LqgdzmQ9znT+M1ht3yniBXMbgvLe/e8Y16bA4=;
        b=oejPwNas+EjGAbFkjQUd3Xi4S+Eyhe27KxmutTdNAqJX1Z0NeZSMQbOdbhk/g20mJQ
         VSMczG4gviwzeqOm3OyBsvxISGOXg0G0qeZiXhOj5vdLLsWbyH+tk1SlFbDbppoGzCQ7
         0IQEcso9fL+rbByQ71wWRxlGk+VVAcG3R5m0j9DWeKfgMzwiniBeYPq68yRe9VUk8Ko+
         Mb3cdmrSapPMdWkejtddwS2TWrRryYX7mCDcs602bmbfOg5zTIXdwm5C2qEX+fM3hipQ
         57QFAzkxDqnCyCQeu1EaduVxHSzaV0v2mXHxQPFU3wI1tJyhKlFvHJVYkJ/kjYpGmszr
         I7HA==
X-Gm-Message-State: AJcUukfAjIvf2P+LRhWQX83cyCPNEuzfLiZSMEqCFufWg+fhpfgdwJkg
        ZnTofxcAzVY5QdEBN7DNVAp4+w==
X-Google-Smtp-Source: ALg8bN5zjsOgQR3YfWoFPVF+LTbe9UvgaHDkgiqVtz2eSEFCd0W16YQUS22HrXH0skbCVp1S8wr/QQ==
X-Received: by 2002:a2e:7e04:: with SMTP id z4-v6mr11747588ljc.97.1547359841777;
        Sat, 12 Jan 2019 22:10:41 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id h21sm15788860lfk.41.2019.01.12.22.10.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Jan 2019 22:10:40 -0800 (PST)
Date:   Sat, 12 Jan 2019 22:00:09 -0800
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Fixes for v5.0
Message-ID: <20190113060009.5fb4zwcjxapltjzq@localhost>
References: <cover.1547115367.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1547115367.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 10, 2019 at 11:18:15AM +0100, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC fixes for v5.0.
> 
> 
> The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:
> 
>   Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes-for-v5.0
> 
> for you to fetch changes up to a64597227d0de5610407fcc95dc835745a53f5d0:
> 
>   soc: renesas: r8a774c0-sysc: Fix initialization order of 3DG-{A,B} (2019-01-07 14:51:51 +0100)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC Fixes for v5.0
> 
> Renesas SoCs:
> * Fix build regressions caused by move of Kconfig symbols
> 
> RZ/G2E (r8a774c0) SoC:
> * Correct initialization order of 3DG-{A,B} in SYSC driver

Merged to fixes. Thanks!


-Olof

