Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:40332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751906AbdGSDY6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jul 2017 23:24:58 -0400
MIME-Version: 1.0
In-Reply-To: <1500305076-15570-5-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1500305076-15570-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1500305076-15570-5-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Jul 2017 22:24:36 -0500
Message-ID: <CAL_JsqJ1mdkXohi_96KPxEWhn=4SPfCKyzROHqrAk6pyM21u3A@mail.gmail.com>
Subject: Re: [RFC v2 4/6] serial: core: support deferring serdev controller registration
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP"
        <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 17, 2017 at 10:24 AM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> serdev controllers may depend on other devices (such as multiplexers)
> and thus require deferred probing support.

I wonder if instead of deferring, we could just delay binding the
devices. There's really no reason to defer the controller. This is a
small addition, but deferring involves a lot of undoing and redoing of
initialization.

Rob
