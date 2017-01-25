Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot0-f195.google.com ([74.125.82.195]:36709 "EHLO
        mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751679AbdAYJr1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 04:47:27 -0500
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW-+pBTnaaiT6B-NnSHQX6giSn0nSQs-+Lvuu1AsjrMOQ@mail.gmail.com>
References: <1485187458-8195-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1485187458-8195-8-git-send-email-ulrich.hecht+renesas@gmail.com> <CAMuHMdW-+pBTnaaiT6B-NnSHQX6giSn0nSQs-+Lvuu1AsjrMOQ@mail.gmail.com>
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Date: Wed, 25 Jan 2017 10:47:26 +0100
Message-ID: <CAO3366wmHZu3P+PZharh9uy_svHPgovFx3LVR4H_h6NYbdedHA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: r8a7796: salvator-x: add SCIF1 (DEBUG1)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 24, 2017 at 9:08 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> While the patch is acceptable as-is, my question is still valid:
> Is there any specific reason you chose scif1 over hscif1?

Conservatism. :)

CU
Uli
