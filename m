Return-Path: <SRS0=uxQs=OU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0225AC5CFFE
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 16:12:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BCE5F20879
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 16:12:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="vb20TmGs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCE5F20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730558AbeLKQM3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 11:12:29 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39396 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727750AbeLKQM2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 11:12:28 -0500
Received: by mail-lj1-f195.google.com with SMTP id t9-v6so13468526ljh.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Dec 2018 08:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pvhpXOMsxkTlIYyqbC40+seCfFxUjBqooYGLPgBruW8=;
        b=vb20TmGsuv0ByrmTk49/pYJuYwDsVs6dIPqJucBacPOsBrkVh1UT1xerHyF/jiFneP
         o/9SngaTur1yLXDGGRzeMhOLNH8ERMTev1Jq1wY7+d9Qmhn9Ci1AgzgT9JsXF6kWnvY2
         TIpD7XziPfA0GGIwNZH1KO2pQbS2iM15AqYU22ML+/mQn1S1SDOEwMujorw+IwKp2j3E
         EQERolRf2hNwEwDldm+0XRQg+IlFcWuAX9cBXhMvzV1UMyWf7jSfqrpFpXo1+83SdN5o
         gAMX9MA+eObK8oRFe4NGQM8VwiYKRWZh4uJTJonbEjlGvG5Ts6gX8ECAxdqe10BeCXKM
         SiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pvhpXOMsxkTlIYyqbC40+seCfFxUjBqooYGLPgBruW8=;
        b=UzIeNlZt9BKTtBuzleDkk+Gx//9XBQbh3vGVyGI2hI6P27FOC+W3dv07W2pmXtFPnw
         P5NBL3dKSF6J16lMqAAnp94FaPknWCk43RxxzWawDyJ/zHo37y12J8Rk0ZpCHt1ygEp2
         uCK4Qji2Kal8upJoJ8HWXJH6mELeIUoYHi9umOXvY9bJNdH5qKJVD9dYyoMQ477qD9LI
         lsvb6+WGBofdZ7bOwCbL1GV2mwR/hb5E2OgkoD4wDuU1kxrpC/MUYjoTZeYSfrhBMbqJ
         OCgOKQV48YMa3/Y37Obh7nSSQZEF85UHOgcdj2tearVXwUtQv0HXWxbjsyDZLaQ86ZoQ
         NNKQ==
X-Gm-Message-State: AA+aEWaCrswkhHytcOyRR0BhNM40w+oCIgCDcHFM794jopdM0oLWzLZv
        duOWvI9QWg4DNmMxxulsUctybw==
X-Google-Smtp-Source: AFSGD/WXMqx+6oXt8/iXdsMMQjmdn9DhXcmWrHs0ZUNkKU5rRJ1rOSanPkWXwfF+7HurIr/E6bM6ew==
X-Received: by 2002:a2e:750a:: with SMTP id q10-v6mr2157610ljc.39.1544544746414;
        Tue, 11 Dec 2018 08:12:26 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id l21-v6sm2772956ljj.48.2018.12.11.08.12.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Dec 2018 08:12:25 -0800 (PST)
Date:   Tue, 11 Dec 2018 08:04:19 -0800
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC DT Updates for
 v4.21
Message-ID: <20181211160419.nl24m6e3s5z2dmd3@localhost>
References: <cover.1544125558.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1544125558.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 06, 2018 at 01:58:23PM -0800, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these second round of Renesas ARM based SoC DT updates for v4.21.
> 
> This pull request is based on the previous round of
> such requests, tagged as renesas-arm-dt-for-v4.21,
> which you have already pulled.
> 
> 
> The following changes since commit 673df60a880f060e3e94920c7b5f7a9ed8aa65f2:
> 
>   ARM: dts: r9a06g032: Correct the GIC DT node name (2018-11-28 13:55:30 +0100)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-dt2-for-v4.21
> 
> for you to fetch changes up to e259e04748e2798a747d9c363ded50514b15a7b9:
> 
>   ARM: dts: r8a7744-iwg20m: Add SPI NOR support (2018-12-05 11:52:46 -0800)
> 
> ----------------------------------------------------------------
> Second Round of Renesas ARM Based SoC DT Updates for v4.21
> 
> * RZ/G1N (r8a7744) SoC
>   - Describe in DT: SYS-DMAC, GPIO, Ethernet AVB, SMP, [H]SCIF{A|B},
>     I2C, USB 2.0 and 3.0 hosts, USB-DMAC, HSUSB, RWDT, Audio, CAN, IRQC,
>     thermal, CMT, VIN, VSP, IPMMU, PMU, TPU, QSPI MSIOF, and PCIE
>   - iWave G20D-Q7 board
>     - Initial support
>     - Enable eMMC, SDHI and SPIO NOR support
>   - Add camera daughterboard
> 
> * RZ/G1M (r8a7743) SoC
>   - Remove legacy "renesas,rcar-thermal" compatibility

Merged, thanks!


-Olof

