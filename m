Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:37548 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751453AbeBTKtm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Feb 2018 05:49:42 -0500
MIME-Version: 1.0
In-Reply-To: <20180220103134.xfh2zl2vgonb2ywb@pengutronix.de>
References: <1519119624-1268-1-git-send-email-geert+renesas@glider.be>
 <1519119624-1268-4-git-send-email-geert+renesas@glider.be> <20180220103134.xfh2zl2vgonb2ywb@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2018 11:49:41 +0100
Message-ID: <CAMuHMdVMoEuOOffRNHDa0JwaLH1auByOQfNW8DgkXGaq5GFnsw@mail.gmail.com>
Subject: Re: [PATCH 3/9] serial: imx: Fix out-of-bounds access through DT alias
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?=
        <u.kleine-koenig@pengutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Barry Song <baohua@kernel.org>,
        Vineet Gupta <vgupta@synopsys.com>,
        Jiri Slaby <jslaby@suse.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-serial@vger.kernel.org,
        arcml <linux-snps-arc@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uwe,

On Tue, Feb 20, 2018 at 11:31 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Tue, Feb 20, 2018 at 10:40:18AM +0100, Geert Uytterhoeven wrote:
>> The imx_ports[] array is indexed using a value derived from the
>> "serialN" alias in DT, which may lead to an out-of-bounds access.
>>
>> Fix this by adding a range check.
>>
>> Fixes: 9206ab8a0350c3da ("serial: imx: Fix out-of-bounds access through =
DT alias")
>
> huh, this patch fixes itself?

Oops

    Fixes: ff05967a07225ab6 ("serial/imx: add of_alias_get_id() reference b=
ack")

>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>  drivers/tty/serial/imx.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
>> index 1d7ca382bc12b238..e89e90ad87d8245c 100644
>> --- a/drivers/tty/serial/imx.c
>> +++ b/drivers/tty/serial/imx.c
>> @@ -2041,6 +2041,11 @@ static int serial_imx_probe(struct platform_devic=
e *pdev)
>>               serial_imx_probe_pdata(sport, pdev);
>>       else if (ret < 0)
>>               return ret;
>
> I'd prefer an empty line here.

OK

>> +     if (sport->port.line >=3D UART_NR) {
>
> I would have used:
>
>         if (sport->port.line >=3D ARRAY_SIZE(imx_ports))
>
> which IMHO is better understandable

OK.

>> +             dev_err(&pdev->dev, "serial%d out of range\n",
>> +                     sport->port.line);
>
> Note that the same overflow can happen when a device is probed using
> platform data (and your commit fixes that, too). Maybe worth to point
> out in the commit log?

That's correct. But board code is tied more intimate to the kernel.
Will update.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
