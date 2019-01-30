Return-Path: <SRS0=dpDL=QG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647F4C282D7
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 10:42:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3691B2184D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 10:42:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbfA3Kmv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 30 Jan 2019 05:42:51 -0500
Received: from mail-qt1-f171.google.com ([209.85.160.171]:39686 "EHLO
        mail-qt1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfA3Kmu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jan 2019 05:42:50 -0500
Received: by mail-qt1-f171.google.com with SMTP id u47so25638953qtj.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Jan 2019 02:42:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YeyAxQ5hjwkykAdT4/swCCucfA6tExp+OHYx6FIZ1Mk=;
        b=LtUEK/UydBSUg9aHsrk8TAonZzWek3A8wfn4Kbp17mKilhedSYfLRTiLbp4nN+G+fB
         Pio1TIZurxWiJDFn/Y/ZtTJsyFI4S6plcuSzz4kQMlXcIf0IR4bpT2abvj/DuBHO9Tar
         xzxZ6ruewtFkcbZto15SO+yzYna7uF4tGBW5Sx6q4h+qxVrpJ5pB44OuigRskeYUcOcX
         Wg4NnDaFCDQGxn039wJ0wozKwhe/aUcBep6JNjahQkrJ+om8bCUJkptyNDCPrQuIusTf
         R72AkCp8cyU3GnUbw8AssfHAioJXDrHq2Vy0ghANVm6koPM4JzEgOzK1J9NLkMsRpTUH
         aC7Q==
X-Gm-Message-State: AJcUukem3Y+F7avSx4QaYTH4YdxQfJIX5kL80/CIVYudsaOSDA49Atrh
        +ICqWoIt1MOt/LdXC7sLjzdimFkMvnvQ7HQ6rg0=
X-Google-Smtp-Source: ALg8bN5PvRjXft0nqQFmlm766TgnGbuZXtYq2YazM7gsZ9GyljnmMYq4/HuBFSAniVT1MhhnzGkA7Mcbjm+4hOSj6Bk=
X-Received: by 2002:a0c:f50c:: with SMTP id j12mr27393683qvm.149.1548844969752;
 Wed, 30 Jan 2019 02:42:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1548843393.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1548843393.git.horms+renesas@verge.net.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 30 Jan 2019 11:42:33 +0100
Message-ID: <CAK8P3a3rZ9tvzXjWRGEiiNeynZHkypPvCa7vPvFxui6H4ttFFw@mail.gmail.com>
Subject: Re: [GIT PULL] Third Round of Renesas ARM Based SoC Fixes for v5.0
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

On Wed, Jan 30, 2019 at 11:18 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
>
> Hi Olof, Hi Kevin, Hi Arnd,
>
> Please consider these third round of Renesas ARM based SoC fixes for v5.0.
>
> This pull request is based on the previous round of
> such requests, tagged as renesas-fixes2-for-v5.0,
> which I have already sent a pull-request for.

Pulled into arm/fixes, thanks!

    Arnd
