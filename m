Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:54374 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932210AbeEWJay (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 May 2018 05:30:54 -0400
Received: by mail-it0-f67.google.com with SMTP id z6-v6so3537497iti.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 May 2018 02:30:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1527065564-9127-1-git-send-email-phil.edworthy@renesas.com>
References: <1527065564-9127-1-git-send-email-phil.edworthy@renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 May 2018 11:30:52 +0200
Message-ID: <CACRpkdY9di8hzPzVvaQjDaAd2ERqYKDwxAUspCKakkmxjD93fA@mail.gmail.com>
Subject: Re: [PATCH] gpio: dwapb: Rework support for 1 interrupt per port A GPIO
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hoan Tran <hotran@apm.com>, Lee Jones <lee.jones@linaro.org>,
        Michel Pollet <michel.pollet@bp.renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 23, 2018 at 10:52 AM, Phil Edworthy
<phil.edworthy@renesas.com> wrote:

> Treat DT and ACPI the same as much as possible. Note that we can't use
> platform_get_irq() to get the DT interrupts as they are in the port
> sub-node and hence do not have an associated platform device.
>
> This also fixes a problem introduced with error checking when calling
> platform_get_irq().
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

OK this patch applied!

Yours,
Linus Walleij
