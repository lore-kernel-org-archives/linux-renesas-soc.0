Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:33367 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751292AbeETN2O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 May 2018 09:28:14 -0400
Received: by mail-ot0-f196.google.com with SMTP id l22-v6so14096667otj.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 May 2018 06:28:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180520070037.8593-4-wsa+renesas@sang-engineering.com>
References: <20180520070037.8593-1-wsa+renesas@sang-engineering.com> <20180520070037.8593-4-wsa+renesas@sang-engineering.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 20 May 2018 14:27:54 +0100
Message-ID: <CAFEAcA9-gA2PYsiOLu3cGFtg1aeCs8n5z+pydsVDeFhzzy2Axg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v3 RESEND 3/3] nvram: at24c: use standard
 error reporting
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 20 May 2018 at 08:00, Wolfram Sang <wsa+renesas@sang-engineering.com> wr=
ote:
> Replace the ERR macro with error_report() because fprintf is deprecated.
> This also fixes the prefix printed out twice.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  hw/nvram/eeprom_at24c.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> @@ -63,8 +61,7 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event even=
t)
>          if (ee->blk && ee->changed) {
>              int len =3D blk_pwrite(ee->blk, 0, ee->mem, ee->rsize, 0);
>              if (len !=3D ee->rsize) {
> -                ERR(TYPE_AT24C_EE
> -                        " : failed to write backing file\n");
> +                error_report("failed to write backing file");
>              }
>              DPRINTK("Wrote to backing file\n");
>          }
> @@ -125,7 +122,7 @@ int at24c_eeprom_init(I2CSlave *i2c)
>      EEPROMState *ee =3D AT24C_EE(i2c);
>
>      if (!ee->rsize) {
> -        ERR("rom-size not allowed to be 0\n");
> +        error_report("rom-size not allowed to be 0");
>          exit(1);
>      }

Hi; if we're going to overhaul the error handling for this
device, I think we might as well do it properly, by moving
the code in this init function which can fail into a new
device realize method. The realize method takes an Error**
and can report failures that way rather than by causing
QEMU to exit.

> @@ -166,8 +162,7 @@ void at24c_eeprom_reset(DeviceState *state)
>          int len =3D blk_pread(ee->blk, 0, ee->mem, ee->rsize);
>
>          if (len !=3D ee->rsize) {
> -            ERR(TYPE_AT24C_EE
> -                    " : Failed initial sync with backing file\n");
> +            error_report("Failed initial sync with backing file");
>          }
>          DPRINTK("Reset read backing file\n");
>      }

Errors in reset and event methods are a bit more awkward;
error_report is an improvement in those cases.

thanks
-- PMM
