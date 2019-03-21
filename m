Return-Path: <SRS0=/KHX=RY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5116BC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 08:58:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 203D12075E
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 08:58:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="YE5x5yoe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbfCUI64 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Mar 2019 04:58:56 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:39866 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728039AbfCUI64 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Mar 2019 04:58:56 -0400
Received: by mail-it1-f194.google.com with SMTP id 139so3035112ita.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Mar 2019 01:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pfORtoGizASpMNUu7xgGtTQ1iqLf+jVEeBZTbaua/oM=;
        b=YE5x5yoeJCB8MtnO9w/00c5s32u8ayuLgIe7GhcImaAIuIubz0pml+UcENTQoTAKHx
         Spk3WkbOdm7mqyhuEYFvlE4GijcFy2gyN8eWeklTDHgJ5LJyyGrFck8vt2n6QxWXVsbz
         xnEa6sJnmOWpIQAkMnfxQGzX9XzRQngmOWRtBoXtH/0G5nQAgyvq/4Yog5abe2nBSIZV
         7jKmpGtx9ajy+XGvzfIhy1+wZL5k8BuXVWBsQzuCWA48jRvcRXuGULlWbly9x4PvX3YU
         aP51l3taqXN8WaHwIYmRbeBHrqV9QkrnIOCWuWBkuXvFlR4+dAx7srae29Nk0LE15vFd
         uanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pfORtoGizASpMNUu7xgGtTQ1iqLf+jVEeBZTbaua/oM=;
        b=mcbtUOkDq+CcEfFPGanB2BinFLPFxDyQojIoZoziyGDydIOohblJ/EwKerITKAmCNK
         6HZrtBPx76NA9QCZtEx85Qdy76XMf4QNnVnuJa3fCWwXN9hyOJhRcIV827id77BWSi+X
         5pBL9q7hAKQ6VhM8Pzu+fCFr8C+MdoVoaStuGPF9geINR1scwHB65iLhXxCarwYX/8ql
         t4JOTFZXNbfIoQ16a1yGZMLpqH2HLlyRa+LIhGgTRvwMeSuIhobE5uRqxKkUBu+t/jh8
         gLsbgp+i5tEkueLhxYCjSPPaX4T1kmwOyD5UfOdmFV1/XqMQOztJqZbNkn09FJlK7Lb5
         rmTA==
X-Gm-Message-State: APjAAAXbUOxB7zrnoHP5fCNJJS3RyPzpBBthkkiO59aX53AKkR1su3kW
        o+9f+RvH4NZrx68kAeUQNma+9Yu7sOnJkim1kF6XdQ==
X-Google-Smtp-Source: APXvYqzH1JaF+NlzrmTBnzR34FQzUDgvhdiH0Mgc9r9HQNRNRmICULOdG4tJLafPH8bOLP6JYpQXpLYAqhj5OgVRCFo=
X-Received: by 2002:a24:79d1:: with SMTP id z200mr1992011itc.53.1553158735818;
 Thu, 21 Mar 2019 01:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190320103351.20609-1-geert+renesas@glider.be>
In-Reply-To: <20190320103351.20609-1-geert+renesas@glider.be>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 21 Mar 2019 09:58:45 +0100
Message-ID: <CAMRc=Md94qf0Nmd8rHGeFyykEqixeKKqTSRBiieVSyTQe83A6g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: at24: add Renesas R1EX24016
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

=C5=9Br., 20 mar 2019 o 11:33 Geert Uytterhoeven <geert+renesas@glider.be>
napisa=C5=82(a):
>
> Document the compatible value for the Renesas R1EX24128ASAS0A two-wire
> serial interface EEPROM, so it can be used in DTS files without causing
> checkpatch warnings.
>
> This is a 2 KiB EEPROM.  The first 1 KiB can always be written, the
> second 1 KiB cannot be written if the write-protect line is asserted.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.txt b/Document=
ation/devicetree/bindings/eeprom/at24.txt
> index 0e456bbc121399b7..22aead844d0f58d6 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.txt
> +++ b/Documentation/devicetree/bindings/eeprom/at24.txt
> @@ -50,6 +50,7 @@ Required properties:
>
>                  "nxp,se97b" - the fallback is "atmel,24c02",
>                  "renesas,r1ex24002" - the fallback is "atmel,24c02"
> +                "renesas,r1ex24016" - the fallback is "atmel,24c16"
>                  "renesas,r1ex24128" - the fallback is "atmel,24c128"
>                  "rohm,br24t01" - the fallback is "atmel,24c01"
>
> --
> 2.17.1
>

Applied, thanks!

Bart
