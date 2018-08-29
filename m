Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:38453 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727204AbeH2Moy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 08:44:54 -0400
Received: by mail-it0-f67.google.com with SMTP id p129-v6so6224482ite.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Aug 2018 01:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <1533628626-26503-1-git-send-email-biju.das@bp.renesas.com> <1533628626-26503-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533628626-26503-3-git-send-email-biju.das@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Aug 2018 10:48:51 +0200
Message-ID: <CACRpkdYEKip_Epcbhi_7qs0hK_QawyETiwn2uRXoTb4brBKfGQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: gpio: rcar: Add gpio-reserved-ranges support
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 7, 2018 at 10:03 AM Biju Das <biju.das@bp.renesas.com> wrote:

> Update the DT bindings documentation with the optional gpio-reserved-ranges
> properties.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Patch applied with the ACKs.

Yours,
Linus Walleij
