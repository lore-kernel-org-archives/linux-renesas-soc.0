Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ig0-f196.google.com ([209.85.213.196]:36231 "EHLO
	mail-ig0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752601AbcDYO5H (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 10:57:07 -0400
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUDTaMyx1Rjtc-z-MsbEmqpRuZNAvQC3sH-JykneJd2Hg@mail.gmail.com>
References: <1461232154-7420-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<874mavb7lk.fsf@intel.com>
	<SG2PR06MB09192CE67BF5338A96FA0203D86E0@SG2PR06MB0919.apcprd06.prod.outlook.com>
	<871t5zb6xl.fsf@intel.com>
	<SG2PR06MB0919CA6B51CAE8FEFFA993D1D86E0@SG2PR06MB0919.apcprd06.prod.outlook.com>
	<CAMuHMdUDTaMyx1Rjtc-z-MsbEmqpRuZNAvQC3sH-JykneJd2Hg@mail.gmail.com>
Date: Mon, 25 Apr 2016 16:57:05 +0200
Message-ID: <CAMuHMdWH3mm0NzmRs0sX7q_nb-HCcdCkTRM1SfteApqQ+feVxw@mail.gmail.com>
Subject: Re: [PATCH] usb: host: xhci-rcar: Avoid long wait in xhci_reset()
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>,
	"mathias.nyman@intel.com" <mathias.nyman@intel.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Thu, Apr 21, 2016 at 2:57 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Apr 21, 2016 at 12:27 PM, Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
>>> > [    1.565605] xhci-hcd ee000000.usb: xHCI Host Controller
>>> > [    1.570636] xhci-hcd ee000000.usb: new USB bus registered, assigned bus number 5
>>> > [   22.270160] xhci-hcd ee000000.usb: can't setup: -110
>>> > [   22.274931] xhci-hcd ee000000.usb: USB bus 5 deregistered
>>> > [   22.280158] xhci-hcd: probe of ee000000.usb failed with error -110
>>> >
>>> > The timestamp is strange to me. But, logs of R-Car H3 (ES1.0) and
>>> > R-Car H2 were the same.
>>>
>>> yeah, seems like your system timer is counting twice for each tick.
>>
>> Yes, I will investigate this later.
>
> The main clock crystal on Salvator-X is half of the expected value. But
> despite the correct value being in the DTS, there's some timer code that
> doesn't take this into account.

It's fixed by upgrading to bootloader v270:

-Architected cp15 timer(s) running at 16.66MHz (virt).
+Architected cp15 timer(s) running at 8.33MHz (virt).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
