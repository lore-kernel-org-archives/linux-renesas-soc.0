Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:49650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753087AbcJCSZz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2016 14:25:55 -0400
MIME-Version: 1.0
In-Reply-To: <1475163064-20399-1-git-send-email-geert+renesas@glider.be>
References: <1475163064-20399-1-git-send-email-geert+renesas@glider.be>
From: Rob Herring <robh@kernel.org>
Date: Mon, 3 Oct 2016 13:25:30 -0500
Message-ID: <CAL_JsqK9JL6UmCzi-szPSakVNp1Cv4-ZVrGnrQ6hdKt_8VJQSQ@mail.gmail.com>
Subject: Re: [PATCH/RFC] tty: serial_core: Move uart_console() check after
 console registration
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP"
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 29, 2016 at 10:31 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The port->console flag is always false, as uart_console() is called
> before the serial console has been registered.

I'm not seeing how that is. Everything uart_console() depends on
(port->cons, port->cons->index, and port->line) should be set already.
Maybe you pass in -1 for index which gets changed to 0 is the only
thing I can see. Is doing that valid if you have multiple ports?

> Hence for a serial port used as the console, uart_tty_port_shutdown()
> will still be called when userspace closes the port, powering it down.
> This will lead to a system lock up when the serial console driver writes
> to the serial port's registers.
>
> To fix this, move the setting of port->console after the call to
> uart_configure_port(), which registers the serial console.
>
> Fixes: 761ed4a94582ab29 ("tty: serial_core: convert uart_close to use tty_port_close")
> Reported-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reported-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> RFC because of the comment "If this port is a console, then the spinlock
> is already initialised", and the pre-existing code calling
> uart_console() before uart_configure_port().

So the spinlock is initialized twice which is probably harmless? If
the spinlock was initialized by the console, then the index would
probably not be -1.

Rob
