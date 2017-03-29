Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:35228 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752499AbdC2MXY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Mar 2017 08:23:24 -0400
MIME-Version: 1.0
In-Reply-To: <1490787774-5796-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1490787774-5796-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1490787774-5796-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Mar 2017 14:23:21 +0200
Message-ID: <CAMuHMdVPRZd5=TUcRsMvrYSFwRStLMcMqk-k+x4aYK4wKRC6-w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] usb: gadget: udc: renesas_usb3: add support for
 usb role swap
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Wed, Mar 29, 2017 at 1:42 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> --- a/drivers/usb/gadget/udc/renesas_usb3.c
> +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> @@ -568,12 +573,29 @@ static void usb3_mode_a_host(struct renesas_usb3 *usb3)
>         usb3_set_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON);
>  }
>
> +static void usb3_mode_a_peri(struct renesas_usb3 *usb3)
> +{
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&usb3->lock, flags);
> +       usb3_set_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
> +       usb3_set_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON);
> +       usb3_connect(usb3);
> +       spin_unlock_irqrestore(&usb3->lock, flags);
> +}
> +
>  static void usb3_mode_b_peri(struct renesas_usb3 *usb3)
>  {
>         usb3_set_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
>         usb3_clear_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON);
>  }
>
> +static void usb3_mode_b_host(struct renesas_usb3 *usb3)
> +{
> +       usb3_clear_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
> +       usb3_clear_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON);
> +}
> +
>  static bool usb3_is_a_device(struct renesas_usb3 *usb3)
>  {
>         return !(usb3_read(usb3, USB3_USB_OTG_STA) & USB_OTG_IDMON);
> @@ -1831,11 +1853,59 @@ static int renesas_usb3_set_selfpowered(struct usb_gadget *gadget, int is_self)
>         .set_selfpowered        = renesas_usb3_set_selfpowered,
>  };
>
> +static ssize_t role_store(struct device *dev, struct device_attribute *attr,
> +                         const char *buf, size_t count)
> +{

> +       if (new_mode_is_host) {
> +               if (usb3_is_a_device(usb3))
> +                       usb3_mode_a_host(usb3);
> +               else
> +                       usb3_mode_b_host(usb3);
> +       } else {
> +               if (usb3_is_a_device(usb3))
> +                       usb3_mode_a_peri(usb3);
> +               else
> +                       usb3_mode_b_peri(usb3);
> +       }

Given the similarity of the usb3_mode_X_{host,peri}() functions, I'm wondering
if the code would become easier to read and maintain by merging them pairwise
into usb3_mode_X_config(), and writing the above block like:

        if (usb3_is_a_device(usb3))
                usb3_mode_a_config(usb3, new_mode_is_host);
        else
                usb3_mode_b_config(usb3, new_mode_is_host);

?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
