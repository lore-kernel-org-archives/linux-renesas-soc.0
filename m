Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314CDC43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 00:27:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E6A4C2084D
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 00:27:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ux24XuFn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbeLPA1s (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 19:27:48 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35457 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727227AbeLPA1r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 19:27:47 -0500
Received: by mail-lj1-f196.google.com with SMTP id x85-v6so8004163ljb.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Dec 2018 16:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ljoYf2t8MNjszVj71lu91rKOCcD6HYcjS7mQbAnFm0E=;
        b=Ux24XuFnJEC+5npFV+kda46elqgbpMCx+e8fM7kX29ZRO7cjj3y4hU/xUg+Wr/73Dl
         xN4g/O+ROZjf9HYvcdkeMhn/OMQD1K4tw6H1tzkpnbJxMyfhnsaFIPl6Sb6Rd+1meZ70
         UWT7zB97nSfraCZYn+MQa+S8KlXhBfeNoRzyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ljoYf2t8MNjszVj71lu91rKOCcD6HYcjS7mQbAnFm0E=;
        b=sIPqO4lZ+PpqsFQ4eF6WoD+IkmfRbv8kGuILUz3cwXeKSitwb1qF4MXU8ZaoBxPgoT
         yVAxTcyfOA+j30f+vc5O9XajX15sEKPaKlxXvykRUaxYrpa+8YNJSRXTolAHknrraZlF
         elkQBXDI0toBwzVs3NuMBOzt+zuG9aXh/2JqlqyNwPn1FmenJrqG3DrDoWj5UtMDrqcm
         Nkx1IQvoPawgZ6OXmAgLjVD0tInvh/HB3bx7JY7p5WkcVAGiYio4IF+eN5MUfsidb8YO
         ApaU896UAsqPwl6HBThRXXy8UZ2TGWWhCyxt+NcTg+PiU62Ee80a+I4e9qZ6+H/8wKb9
         41ng==
X-Gm-Message-State: AA+aEWanIVu5QpNsd6zzNb//cvgnSjQXwcKu8pKzriBbpQIDJVvTbLE+
        dIdMjhyYol0nb7kwOlbv0MeHtEZJJ7onluf6tRQjxQ==
X-Google-Smtp-Source: AFSGD/UNnex1eK9tr06R+KeGvzLrrDOlu1WdE5601v/64ZjaN/Y31IltpN2MsfZeCmBMtSt+GgKNb54YhbSYzMKEHeI=
X-Received: by 2002:a2e:7403:: with SMTP id p3-v6mr4626471ljc.97.1544920066112;
 Sat, 15 Dec 2018 16:27:46 -0800 (PST)
MIME-Version: 1.0
References: <20181212014002.4753-1-marek.vasut+renesas@gmail.com>
 <CACRpkda_062r5KzTtPE6zf+FDXGiLqCTw=Q1AB3SKLkAa05Qsw@mail.gmail.com> <2bbd5d03-a081-bf87-1c20-79f8eedeb4ad@gmail.com>
In-Reply-To: <2bbd5d03-a081-bf87-1c20-79f8eedeb4ad@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Dec 2018 01:27:34 +0100
Message-ID: <CACRpkdZi2kBJj+vBqK-Wf6UqVphBnHzoON=p+WtHpEAFpgPy=w@mail.gmail.com>
Subject: Re: [PATCH V2 01/14] gpio: pca953x: Deduplicate the bank_shift
To:     Marek Vasut <marek.vasut@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Dec 15, 2018 at 5:48 AM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 12/14/2018 03:50 PM, Linus Walleij wrote:

> > Some can be quickly
> > supported by just adding the .set_config() callback, others like
> > pull up/down are more dubious. If it supports open drain in hardware
> > we should definately make use of it. Just in case you're interested!
>
> I went through the hardware I have around and the datasheets to the
> PCA953x chips on them, but I couldn't find a board which would have a
> PCA953x chip with those extra features. I'll keep my eyes peeled for a
> board with one.

It appears Thomas needs those features so let's let him have a go
at it :D

Yours,
Linus Walleij
