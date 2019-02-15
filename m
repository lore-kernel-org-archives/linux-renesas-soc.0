Return-Path: <SRS0=NmnW=QW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE0BC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 14:49:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 84F462192D
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 14:49:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbfBOOtl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Feb 2019 09:49:41 -0500
Received: from mail-qk1-f176.google.com ([209.85.222.176]:39924 "EHLO
        mail-qk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfBOOtk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Feb 2019 09:49:40 -0500
Received: by mail-qk1-f176.google.com with SMTP id x6so5817392qki.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Feb 2019 06:49:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ls4TuvD97ikE+e3QT4DuO6Sck09Xcnoh+BEr5oId9DA=;
        b=dZkmQ4JwJMxNPZJvv3jxug9RV29Ni10Qi4qH5KnkVF9cCNBB5dUU5IgVyKSyjANTXO
         OwX8DXfbmJaVhLXY8EQQ8fVqm6wZW4AB81pg262iBFh0bGHiWg2PYy8s7ZWW2oT5zCL4
         4p1b4OBcapVyR9CR3TeBTdsQUuukj8oO85pTQ8RUcq533pnPyD8cJ3RYLMpEgvnvZXwv
         dHtx3eEq5pQznKtEGgR8l1ip6jNIjcrKuwoAmsEX+6WHZCHA7ODuWPGHX/uVh1WvB/nn
         8UGtQ9ol7vtaa7fS8KNiEN+dWusdfEFl7gyqGTS+gOnY881ey1gJqxDokK5lGvH6AbIC
         f+3w==
X-Gm-Message-State: AHQUAuYDgC8ym3bdNN5vEKIwK61RICNexDr/N+aek+yeYroh0UMWQuSN
        VYvA3YCW9vXeRI+Z8x3//OTy2u5pnqMVdx0f904=
X-Google-Smtp-Source: AHgI3Ia/9H2F+WloxiAKHfZv4GYot/sFYBE+8h5fbwc4EFp+jaQ1Q1AMSTwb0ldjcg/+dgpvmfai0G8vkMtm7NxyOg8=
X-Received: by 2002:a37:d492:: with SMTP id s18mr6912080qks.343.1550242177818;
 Fri, 15 Feb 2019 06:49:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549623128.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1549623128.git.horms+renesas@verge.net.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 15 Feb 2019 15:49:21 +0100
Message-ID: <CAK8P3a0kYxNOU9PRWwAXJf-u49Ozu=vnL8KFw6HYOqHC-YBHgg@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC DT Updates for v5.1
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

On Fri, Feb 8, 2019 at 12:14 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> Renesas ARM Based SoC DT Updates for v5.1
>
> * R-Car H2 (r8a7790) based Stout board
>   - Convert to new LVDS DT bindings
>
> * R-Car H1 (r8a7779) and M1A (r8a7778) SoCs
>   - Describe HSCIF0/1 devices in DT
>
> * RZ/G1M (r8a7743) SoC
>   - Correct sort order of the RWDT node
>   - Remove aliases: should be defined in board rather than SoC DT if needed
>   - Remove generic compatible string from iic3: it is not compatible
>
> * RZ/G1N (r8a7744) SoC
>   - Describe LVDS and DU devices in DT
>   - Correct sort order of VSP and MSIOF noces
>
> * RZ/G1C (r8a7747) based iWave SBC
>   - Enable RTC
>
> * RZ/A2M (r7s9210) SoC and EVB
>   - Initial support

Pulled into arm/dt, thanks!

      Arnd
