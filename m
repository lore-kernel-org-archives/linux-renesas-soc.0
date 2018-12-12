Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B36C67839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 22:16:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0AB3520870
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 22:16:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="sVzUgy6V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AB3520870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728492AbeLLWQN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Dec 2018 17:16:13 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40836 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728483AbeLLWQM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Dec 2018 17:16:12 -0500
Received: by mail-lj1-f194.google.com with SMTP id n18-v6so17720240lji.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Dec 2018 14:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wi2YUUlP6mRKIejs9eBJwmgE+4wUHCKv+7WuMQrRggA=;
        b=sVzUgy6VI4R8RQYgffgBtY5umERPH/HoCusAKNiYWLgpBHeIj4mqa+EQMnxCwYGPcZ
         6O5byu0/bpbBHuuQnsbF4Ogkjh11nIq8JeIGXwXjqPUd7DDuvLZ8k3OqNPwoQmLQmajr
         hwJMTM/j2V1ZpGNF+aqmzNAdZuH5KFwB3+dgWQtAgjb5v3KxZ2TYQkE/aXAu0bVBgw0w
         JSfhRrFkTy/e4IHfuBUM/ZjnQT2Lkbj/lOz6S2MFYpwlYHDd9bGe0/t7fY9Y+Tr7jDBT
         edDuQy5C1PynqLojGgMXjzZYRM03imV3tl7v9vV8KD2mozg86yDGoaf+x/L2h9ZrN5IW
         Owvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wi2YUUlP6mRKIejs9eBJwmgE+4wUHCKv+7WuMQrRggA=;
        b=UjpqxgK9JLDVHfbSP2Esv+OdjklMGPBYWPSdfvgM8OFmFiWOpvKOTeD12yzN8i8xeK
         55TrfVxliuliYkBteC+Q0h6L2VePW5unsQFKQlCGsM9dJxJdJPfjkWQQtr8P5oWeeptr
         UvwzbnqJ3iEc6FHYhDmt8zy48g5OrNxToLgjiZZozsS2yaQmWaCEuxOCO+zi/sG7QfRu
         UqOI8LNPBsJsFhBAdv/MuBgS4+y0dBVVb2ng6KLF6WPj36WOu1E9IGx+LclHxYYYf8aP
         p5u5gKaxwaUuleQtpHWs3UEOQSIpohrl8Kg/xdKrDGZ8xdD4SQHlw2pKGMqefJxmg+oB
         7ZDQ==
X-Gm-Message-State: AA+aEWadkqq62srOOza20RybuZUOHaTA8wJOKnJnLjh9VKlmKJQ/uIEd
        ErEtvgqkBhzaZSMDsRC2KpuSqA==
X-Google-Smtp-Source: AFSGD/UfkPX95RrEzDSdo+LRYJel6aawPpIzjZk06bMbr3yR/S+XGnrRlc8EKw48fVOVgEFQo8mK0w==
X-Received: by 2002:a2e:9a16:: with SMTP id o22-v6mr13334853lji.112.1544652970357;
        Wed, 12 Dec 2018 14:16:10 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id h3sm3954lfj.25.2018.12.12.14.16.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Dec 2018 14:16:07 -0800 (PST)
Date:   Wed, 12 Dec 2018 13:42:30 -0800
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v4.21
Message-ID: <20181212214230.stbka7njol6qgvpj@localhost>
References: <cover.1544126077.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1544126077.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Thu, Dec 06, 2018 at 01:57:02PM -0800, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM64 based SoC defconfig updates for v4.21.
> 
> 
> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:
> 
>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-for-v4.21
> 
> for you to fetch changes up to fe16bcd6d44f1a2bccc4618119463d9d23a6ae92:
> 
>   arm64: defconfig: Enable CONFIG_PHY_RCAR_GEN3_PCIE (2018-11-16 06:56:49 -0800)
> 
> ----------------------------------------------------------------
> Renesas ARM64 Based SoC Defconfig Updates for v4.21
> 
> * Enable in arm64 defconfig:
>   - Renesas R-Car Gen3 PCIe PHY driver
>   - Renesas R-Car thermal driver
>   - ASoC simple SCU sound card support
> 
> ----------------------------------------------------------------
> Geert Uytterhoeven (1):
>       arm64: defconfig: Enable CONFIG_PHY_RCAR_GEN3_PCIE
> 
> Simon Horman (2):
>       arm64: defconfig: Enable R-Car thermal driver
>       arm64: defconfig: Enable scu-simple-card driver

This patch enables the sound driver as a built-in. We normally try to keep all
non-critical drivers (i.e. drivers not needed to reach a rootfs) as modules to
avoid the defconfig kernel from bloating up too much.

Would you mind respinning this with the sound driver as a module instead?

For PCIe I can see the argument that you might have rootfs on nvme or otherwise
attached to that bus, so static there is fine.


Thanks!


-Olof
