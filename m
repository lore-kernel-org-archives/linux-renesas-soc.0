Return-Path: <SRS0=NmnW=QW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6C6C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 15:51:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BBDC62192D
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 15:51:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729496AbfBOPvW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Feb 2019 10:51:22 -0500
Received: from mail-qt1-f179.google.com ([209.85.160.179]:38464 "EHLO
        mail-qt1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbfBOPvW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Feb 2019 10:51:22 -0500
Received: by mail-qt1-f179.google.com with SMTP id 2so11361583qtb.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Feb 2019 07:51:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A0ncvAvs0CopAEtFBxtYq1Wuv6rxjnhVhXjZh7nwbog=;
        b=L9hj4NxL2gBTkIpIHd5dcMPFM1ibWSCRkA4yUEurZHCuFuGm1RvujMx6j81TVwJPpo
         imQh/3dTh0QYbhjwRXYSrd5DObhyKh7v7iJwk2iEgDM6V47/k0QZti7fxUxehh4xYRY/
         /qLzQrtVIim8Q8s2u/kPQUmQbWQu7GVAs5RZRTKRlNIVw7uzD8CfdXhfvUFYfR/3MHbT
         6WSiH4E2VjyBuK0DNC2yd3RIE/B7x/hgPRUXQ+zVAAIgv2d6VTrjXHyQtaqinJybz2uu
         RvkgNkkCGeLsqG5D17bSBvYhxSmiKbrLseQYpQJUpp6V7h44ero4JxDtupUqCAmHFveR
         sGYg==
X-Gm-Message-State: AHQUAubdr+vyjvkxs25UxTevaV8QJhlciOBK3rmsObjMd8LRFc/JD60F
        g6HSRCKknZTJnsBRMJjPGBvS0BT1Nj0Mc/nWkA8=
X-Google-Smtp-Source: AHgI3IbXcWmxobt6d+bj6oxqQphA3P6rtMtvx8tc/IQPbo8UnJTzxAKeSWx6xoLd/ZAG65MHWtrXnaaEJRrBdHUc9Aw=
X-Received: by 2002:ac8:1d12:: with SMTP id d18mr7951945qtl.343.1550245881500;
 Fri, 15 Feb 2019 07:51:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549622798.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1549622798.git.horms+renesas@verge.net.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 15 Feb 2019 16:51:04 +0100
Message-ID: <CAK8P3a12JVQX4EktSQDvC35_2=JHKQ5fW0ne9zpATGANRBmRDA@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v5.1
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm-soc <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 8, 2019 at 12:13 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> Renesas ARM64 Based SoC Defconfig Updates for v5.1
>
> Enable:
> * PCM3168A support which is required for audio on Kingfisher daughterboards
> * R-Car thermal support
> * Gen3 PCIe PHY support

Pulled into arm/defconfig, thanks!

    Arnd
