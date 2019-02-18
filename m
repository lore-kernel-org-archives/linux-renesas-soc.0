Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21ECEC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 12:46:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ED34F2173C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 12:46:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729578AbfBRMq3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 07:46:29 -0500
Received: from mail-qt1-f173.google.com ([209.85.160.173]:45478 "EHLO
        mail-qt1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729523AbfBRMq3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 07:46:29 -0500
Received: by mail-qt1-f173.google.com with SMTP id d18so8900036qtg.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Feb 2019 04:46:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZrEx2cRQxdXeodqjUo4XIcaCBR+a+Rm+BO9bl4vQgE0=;
        b=tqDtg1x4JsUQL0K9Lb43BJQsJdRuVuuk4Vc3osQG6pL18crH1RokgdiVgN9HkIftuz
         QhWrX4gvtNgfiyNWAnScYFI8LNySqzR03/GArExX1fHq3O/WxwMgYz32gk6Gi7xoRBYk
         PpICQqSunhrX60pj35nWZ14OxgZ/jaHCwRlCr5UwIfHxfPvThEGL4qPOBuvNXh0aJxr2
         MpMh9Bm8Zmpn7uPvlaVtEB+p+SsU+yY0jE1SH2cuhnyHv3IB/eQ+kSr1NNWn+7dCpnTS
         Ml6LcSSKZD/MG7zZg27003Zh86nrllTviK3FCvS1tbSY1wANQQJ4xVSVIrDLhOF/InQj
         rH8w==
X-Gm-Message-State: AHQUAuYe4lnaqp8VZAkm82DzqwDZCFbHsh2pfmVtC80bTcihI/kENHlo
        o7P8GsUy5iKMrRvTpe2V5vUvXIZ4ZuSfDGYHbbQ=
X-Google-Smtp-Source: AHgI3IbcUInUC9bZ2/6MuX6JJ/ZxG4chFw+umwjVbPJvSTQCiJCExkippLPqaUdbHRq6riEsVeCXIO/97R19AkMcaUQ=
X-Received: by 2002:ac8:2c34:: with SMTP id d49mr18293738qta.152.1550493988723;
 Mon, 18 Feb 2019 04:46:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549624030.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1549624030.git.horms+renesas@verge.net.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 18 Feb 2019 13:46:12 +0100
Message-ID: <CAK8P3a3Ja1H5mH7zLTq6ruPrt6D5nBCVML1=ejpvL3i4+MKJ3g@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC DT Bindings Updates for v5.1
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

On Mon, Feb 18, 2019 at 11:48 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> ----------------------------------------------------------------
> Renesas ARM Based SoC DT Bindings Updates for v5.1
>
> * Convert Renesas board/soc bindings to json-schema
> * Correct SoC missmpatch for R-Car H2 (r8a7790) based Stout board
> * Document RZ/A2M (r7s9210) based EVB
> * Document RZ/G2E (r8a774c0) based cat87[45] boards

Pulled into arm/dt, thanks!

     Arnd
