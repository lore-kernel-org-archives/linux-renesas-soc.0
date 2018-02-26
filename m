Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:42675 "EHLO
        mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752402AbeBZJCe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Feb 2018 04:02:34 -0500
Received: by mail-oi0-f50.google.com with SMTP id c18so1726772oiy.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2018 01:02:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXeLXTnUDwxjkGsaeiHvdTZdc-XzE2+2bgC394S6RyxdQ@mail.gmail.com>
References: <1518696091-23561-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1518696091-23561-2-git-send-email-ulrich.hecht+renesas@gmail.com> <CAMuHMdXeLXTnUDwxjkGsaeiHvdTZdc-XzE2+2bgC394S6RyxdQ@mail.gmail.com>
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Date: Mon, 26 Feb 2018 10:02:33 +0100
Message-ID: <CAO3366yvjPm+kqbG0Do6dE5H0_s98_hOzhj=aaVyJUsJCF18TA@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: sh-pfc: r8a7796: Add VIN4, VIN5 pins, groups
 and functions
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kbingham@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 20, 2018 at 2:58 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Would there be a use case for vin4_data4 and vin5_data4, or is that
> mode only supported on R-Car H2?

The docs don't mention it, so I would assume it's not supported.

CU
Uli
