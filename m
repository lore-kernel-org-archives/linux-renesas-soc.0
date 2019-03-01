Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52096C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 14:45:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D4DC20675
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 14:45:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LsEswvgC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbfCAOpf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 09:45:35 -0500
Received: from mail-lf1-f44.google.com ([209.85.167.44]:46644 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388217AbfCAOpf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 09:45:35 -0500
Received: by mail-lf1-f44.google.com with SMTP id g12so18168603lfb.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Mar 2019 06:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=soCVc2BBERAW24huteBcFpb4I5B/7CpqodHEJ44x2RQ=;
        b=LsEswvgC9ydHztpJPccP8BcMoYDb4hH2nNL1qB3cOTOGJDJywMHQeqWj9Smc6MVZg8
         XS/RfgX4PcMnmfAu5tCBEo0vc9HmsoGc7q9IlwxAm8SrkB+7RPzkMw0HgUsTdPH3WWex
         kpnYcWxV/y53hHMwo3xLeP7w87qfedr/PNd0HlHQBzKRhZVd7vnfC/TLwTTKmhatxYhH
         Vqlp9vrfPNyqj9Wj8/0IHkib2YRzeEaI10LYcWAzuNKVpAKhD30+eceSHcTCOkXYqUKp
         lw88ty8xwvCgJBrKlzVfruFBvxqyf5cDv9ywusYQUc2yl4F9DS4YlBDgLaw9VSmW2OYn
         MBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=soCVc2BBERAW24huteBcFpb4I5B/7CpqodHEJ44x2RQ=;
        b=fdN5tHXq0u/xtO6LWvUYCQsEh+qARKPZ0kPxpdUNM6Lp/adkKL8SJQdRe6f46GeK/k
         CeleHJl8RTmeVAJQLteyyfQl39KETIHPofTgX/rbwniPdz+s5pxq1e2eckMZ0sOK7WvE
         zQBxLnwIQnPjT2T8iBCZi7KrIw5B9vATIy1boPPdS7BQzlX5ncL1uKlzKM/Cv5uuEXdy
         Y26BQP/9RgERc79CF/CVJ/o2MAwf9eRuV5qDVNNG2GZz7Es9gOuOFKoRz88uniH7Ddt9
         aZJpMU3FVrl5vlr8OYD88EQ/YJVHXiNkiFaxFch5OWK60GTJ0Dta26SErd5PHm1MXtcl
         C3XA==
X-Gm-Message-State: APjAAAUs5Op9lqqsKN38YmpZ1DyXcNLrJHfKgvQMQ823nhmxh64Q9L57
        xMRkCk6V7dqR95kGYH73sJhlvxphGnV1ZiTYSCfYlQ==
X-Google-Smtp-Source: APXvYqxzT1HtrHoDQ2Aoxpu9Opej+4ePMUX46nS/rwieQ1+hryntBoyq3nNgu2FwzQ9AxCEv4hS7gs9z50DZG9vd2IA=
X-Received: by 2002:a19:e05e:: with SMTP id g30mr3094885lfj.167.1551451533289;
 Fri, 01 Mar 2019 06:45:33 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdVXsLDPiGw81LVuoOpOnnRX_gswkqB--6mGodP06UqHmw@mail.gmail.com>
In-Reply-To: <CAMuHMdVXsLDPiGw81LVuoOpOnnRX_gswkqB--6mGodP06UqHmw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 1 Mar 2019 15:45:22 +0100
Message-ID: <CACRpkdakFzqU8_VcVFb68UNQhi6pnauGxy0MKdUpsfyz-D0aNw@mail.gmail.com>
Subject: Re: Requesting false output GPIO as IRQ
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 26, 2019 at 11:01 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> While I strongly agree the firmware should be fixed not to configure
> random GPIOs as outputs, shouldn't Linux just override this, if the GPIO
> is not marked in use (has not been requested)?

commit 7e7c059cb50c7c72d5a393b2c34fc57de1b01b55
Author: Linus Walleij <linus.walleij@linaro.org>
Date:   Wed Jun 22 16:31:54 2016 +0200

    gpio: convince line to become input in irq helper

    The generic IRQ helper library just checks if the IRQ line is
    set as input before activating it for interrupts. As we
    recently started to check things better with .get_dir() it
    turns out that it's good to try to convince the line to become
    an input before attempting to lock it as IRQ.

    Reviewed-by: Bj=C3=B6rn Andersson <bjorn.andersson@linaro.org>
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

led to:

commit 78456d6ff815894e593675fc524cade9844501d5
Author: Linus Walleij <linus.walleij@linaro.org>
Date:   Wed Jul 6 14:40:08 2016 +0200

    Revert "gpio: convince line to become input in irq helper"

    This reverts commit 7e7c059cb50c7c72d5a393b2c34fc57de1b01b55.

    I was wrong about trying to do this, as it breaks the
    orthogonality between gpiochips and irqchips.

    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Mainly because of Grygorii's remarks:
https://marc.info/?l=3Dlinux-gpio&m=3D146779605005475&w=3D2

Yours,
Linus Walleij
