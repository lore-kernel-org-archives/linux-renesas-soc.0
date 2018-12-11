Return-Path: <SRS0=uxQs=OU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCE0C5CFFE
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 16:12:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F4DC2084E
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 16:12:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="CugkIMMj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F4DC2084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729556AbeLKQM0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 11:12:26 -0500
Received: from mail-lj1-f176.google.com ([209.85.208.176]:43716 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727750AbeLKQM0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 11:12:26 -0500
Received: by mail-lj1-f176.google.com with SMTP id 83-v6so13465379ljf.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Dec 2018 08:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ck/FSZO7jWggSIW7ULqD4HCObC0D0q/0vy+h1RN4vaQ=;
        b=CugkIMMjGtAQ3TLZy2q7iKCoTI+eR69Ljj6rybSHa+yP9gpO7yAUVqQC1+jCXLLq8A
         78zDl3Wd5yGU1jv9jenf64d5DR5hUORzqdrhOK7r0HUI3z5qhpU39WrmKAvdZw2jvvsV
         j/v0AJVsIuxvFbyPrvLdXFrQXSsna+fgnV3e0un+5y1Z9S6sku2K+BxzPfPbybsAFWbg
         Mk3LDhm9WQJqrOBD97H8psDHTHLtqf9T5NprFDA3+mQKwWpZrdA+od4ndnV1aM+ydJzt
         1BRI8Ys+TWSneiW/IjUltPwZwGqIPHWVabryt3XFZLG7PPZ1/WYyikqpSPZqSm4HV/WE
         gBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ck/FSZO7jWggSIW7ULqD4HCObC0D0q/0vy+h1RN4vaQ=;
        b=ZGiwXPqoLKr4GNI13rMqe8eN3/XaibH5mmAXmC0jbYbZAibeiIgR3uUj8FtnGp6b3E
         cOEqtuwXh1H5TNuDSp4OvBs1XoGQxt04k1V2IgfeJ+yBTS5lVdI56B5TE6I4E8+p5ChA
         ERb5FzjAT9WJqFPPczZ7eAZaYqOLVu2W+enKVFEUUUcNJbTwfYPKn5dcEvAjwhMUKm1j
         jbHeOIjUE6Ji/d0gdtEhLiwnN7zJl8PTmflqYnPZwOoQrHNjHQ3HYLwlBajPL1BO5095
         BGwUQXbJAsDvjKL+FmHDujMHw2gz79gqvz9cXXa718noCYMhQ13dOG9VT/CIP4aUjk2o
         8lHg==
X-Gm-Message-State: AA+aEWbXu8WMVKIZUiHYphgtSQa1dWHHCtOdFEcazbluMtgyVp8vbtRW
        ekACbQ+e29X+nvmVcP+PxHcLMQ==
X-Google-Smtp-Source: AFSGD/XdkN9wROgYSGhx1TrTsL4t2EWmnMC5Hi2SA6kh3wpWzx3Obx08u7fkAP/ejqHQp3i94wFA0g==
X-Received: by 2002:a2e:2b85:: with SMTP id r5-v6mr9806980ljr.91.1544544743905;
        Tue, 11 Dec 2018 08:12:23 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id a18-v6sm2731424ljk.86.2018.12.11.08.12.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Dec 2018 08:12:22 -0800 (PST)
Date:   Tue, 11 Dec 2018 08:02:16 -0800
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates
 for v4.21
Message-ID: <20181211160216.dk3sp6ebyqochg7x@localhost>
References: <cover.1544126426.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1544126426.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 06, 2018 at 01:57:30PM -0800, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these second round of Renesas ARM64 based SoC DT updates
> for v4.21.
> 
> This pull request is based on the previous round of
> such requests, tagged as renesas-arm64-dt-for-v4.21,
> which you have already pulled.
> 
> 
> The following changes since commit 275e4eb3f21a09b6b8bd4a353b9a01e500240385:
> 
>   arm64: dts: renesas: Add all CPUs in cooling maps (2018-11-26 09:11:44 +0100)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt2-for-v4.21
> 
> for you to fetch changes up to 4fbd4158fe8967e9296516ebae2cfaf7a1c7a214:
> 
>   arm64: dts: renesas: r8a77995: draak: Add backlight (2018-12-05 11:45:44 -0800)
> 
> ----------------------------------------------------------------
> Second Round of Renesas ARM64 Based SoC DT Updates for v4.21
> 
> * R-Car D3 (r8a77995) SoC based Draak board
>   - Add the backlight device for the LVDS1 output
> 
> * R-Car H3 (r8a7795) ES1.0 SoC
>   - Add missing power domains to IPMMU nodes
> 
> * R-Car M3-N (r8a77965) SoC
>   - Remove non-existent IPMMU-IR

Merged, thanks!


-Olof
