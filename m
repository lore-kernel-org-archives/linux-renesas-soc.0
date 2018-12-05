Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37872 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727309AbeLEVxj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 16:53:39 -0500
Received: by mail-lj1-f193.google.com with SMTP id e5-v6so19794226lja.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Dec 2018 13:53:38 -0800 (PST)
MIME-Version: 1.0
References: <20181122201941.1654-1-vz@mleia.com>
In-Reply-To: <20181122201941.1654-1-vz@mleia.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 5 Dec 2018 22:53:24 +0100
Message-ID: <CACRpkdZYtZqrgk3m46s3MxgMzmjcAj=OpRmZ_mij2kcO9HmqoA@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: reference device instead of platform device
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 22, 2018 at 9:19 PM Vladimir Zapolskiy <vz@mleia.com> wrote:

> The change simplifies dereferences to the mediated struct device, also
> it allows to limit the scope of the platform device usage to probe and
> remove functions only.
>
> Non-functional change.
>
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

Patch applied with Geert's review tag.

Yours,
Linus Walleij
