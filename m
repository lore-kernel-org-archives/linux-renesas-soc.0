Return-Path: <SRS0=lhsG=QE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669C8C282CD
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 14:03:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F02420989
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 14:03:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="jDIbiQAj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbfA1OC7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Jan 2019 09:02:59 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35396 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbfA1OC7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jan 2019 09:02:59 -0500
Received: by mail-lj1-f196.google.com with SMTP id x85-v6so14339998ljb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Jan 2019 06:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G4fDx/Ho92743fFRT0f+aMg9C1e/AJQlOgfses2xDrA=;
        b=jDIbiQAjVkEqNBx3+WZwWpv486CdBBJb3RZ5y9wHYZvpubqEbcqtjI3PMdZkwYloq/
         BK84Pit4QozRBqpNoYSs/UQ1xbRa+gzlE9bJDbjhzpG2Xde6vXUkc09JF4SEVDB4b6vx
         bJpTtUu04Gb2eYMkFV0K8dGFqBCZw0aGH/UPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G4fDx/Ho92743fFRT0f+aMg9C1e/AJQlOgfses2xDrA=;
        b=SAcgUOPae/zRF7Cqh3qxh6csvRAC/kq6VcQ5xQi283l5FMSZVF/O/Z9slF1VZr3ofB
         1PyrhuU7RdXir6HX5MyCKdDIL8nbY5OT8VaAhbYAqj7KkBobWKq5rj2Y1JmzhVIrS1VB
         bi15Tl35ZHdzdJSEzeRtvL1FzL1d8HONeixbFnNCjZCShHogojvi9VtJA5MFvJOSbV4b
         NfNNdW2jj0UmKIwzEt9wA4yfP8uq0S9iTrwaYQbzILbqDZMh+QSGv9W3c7UOJBF8jLdh
         pPabgQO47ExnDB2I69pyzGRWsOm8qAJG2FuJVukJRXgt08iRj08MNyyWJppPIxV7OwiS
         OWKg==
X-Gm-Message-State: AJcUukfC0GSThq24HWMW2ClXz/FRR0lMJWYhYO14Y6AqbV+qo5PtVYAT
        8kQoSGb1NnyiCAAraXMWCqQT97ecWMb4ilYsNa/GK8Ws
X-Google-Smtp-Source: ALg8bN6eItLpaC0NPm2ckgjaktT+CqbUalhYJ1dKErZX5d37FdJOSBoDW2cebhMah3d8XP4jyxc+d8k/apjC1ruXkyY=
X-Received: by 2002:a2e:131a:: with SMTP id 26-v6mr16760507ljt.107.1548684177213;
 Mon, 28 Jan 2019 06:02:57 -0800 (PST)
MIME-Version: 1.0
References: <20190124152623.30983-1-geert+renesas@glider.be>
In-Reply-To: <20190124152623.30983-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 28 Jan 2019 15:02:44 +0100
Message-ID: <CACRpkda7Ar7Z3z+=5wghjDjb0xa+CrnrBiSsJTWuKF1Dx8xh5w@mail.gmail.com>
Subject: Re: [git pull] pinctrl: sh-pfc: Updates for v5.1
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 24, 2019 at 4:26 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:
>
>   Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.1-tag1
>
> for you to fetch changes up to 8e32e881947be98abaa917157fefc4a3319e90af:
>
>   pinctrl: sh-pfc: r8a7778: Fix HSPI pin numbers and names (2019-01-21 13:25:38 +0100)

Pulled into the pinctrl devel branch!

Excellent work as usual.

Thanks!
Linus Walleij
