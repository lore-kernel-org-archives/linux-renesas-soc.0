Return-Path: <SRS0=NmnW=QW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91DEC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 14:45:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77CDA2192D
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 14:45:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbfBOOpH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Feb 2019 09:45:07 -0500
Received: from mail-qt1-f181.google.com ([209.85.160.181]:39720 "EHLO
        mail-qt1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbfBOOpH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Feb 2019 09:45:07 -0500
Received: by mail-qt1-f181.google.com with SMTP id o6so11083264qtk.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Feb 2019 06:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4dQCXtTh70dEt+QcWeT5aM6/sFGGCiwIdXV4fLqL9O4=;
        b=oIreIZDRN8L+OJ/Wzx0H21mFt8pvOUjbDf95Po6PwPT8MWDSnl5Cm2AmFB9KgccOP2
         z/pyZRurFnzH9XDNHJTSfpxqSerE5gkRgKJJ+vwUuNlZ+wzCvkQWgCLH6CYZwLFF13Fa
         ElUIicKqeQ98Nt077ogqtNWrR8DGVFUdY4mWnZVOyyQMKEasTzt7ZPNMdd0aHWz8SNaF
         VAbbErA2C9EbzQfS2mtRnCiKbu+FfbxjeYtjGOPwXy4X8RQc2c2I/wXmsFkl/UWqGuj0
         CjTnQ0tUNFFWjOXDutNdASDil8cZTepLKGCRIeyArZwT1P/CwjCv0WKrP9SsyD1iQhQo
         J75g==
X-Gm-Message-State: AHQUAua8kBBMzJok+j0Inda8hascWoJxR2tUDzhaYpuZ8+J9c11oIkFF
        +b44WPdhZwKhK4wGgZ1c76+io+hO25NvY3vHF/Y=
X-Google-Smtp-Source: AHgI3IZyGjXtjh6SrpM/ESzMCdISR/8UvnnwOUA/T/fLl6o6Cv09C45/e3AQoZsT1u0Mvls5DDH54Lr/gXjj1sMq3yA=
X-Received: by 2002:ac8:445a:: with SMTP id m26mr7740711qtn.212.1550241906159;
 Fri, 15 Feb 2019 06:45:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549623801.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1549623801.git.horms+renesas@verge.net.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 15 Feb 2019 15:44:49 +0100
Message-ID: <CAK8P3a2UW2yQPFfrWBGDzcJJ3a+2cP3kKwigKiafPWOADgwsZg@mail.gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates for v5.1
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

> Second Round of Renesas ARM64 Based SoC DT Updates for v5.1
>
> * R-Car Gen3 SoC based Salvator-X, Salvator-XS and ULCB boards
>   - Enable HS400 support for eMMC
>
> * R-Car E3 (r7a77990) SoC
>   - Add OPPs table for cpu devices
>
> * RZ/G2E (r8a774c0) SoC
>   - Describe TMU, CMT, SDHI devices in DT
>   - Describe pincontrol support for SCIF2 device in DT
>   - Add OPPs table for cpu devices
>
> * RZ/G2E (r8a774c0) based EK874 board and CAT875 sub-board,
>   and CAT874 board
>   - Initial support

Pulled into arm/dt, thanks!

      Arnd
