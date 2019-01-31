Return-Path: <SRS0=mg4H=QH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529CCC169C4
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 31 Jan 2019 11:11:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D8142087F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 31 Jan 2019 11:11:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbfAaLLv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 31 Jan 2019 06:11:51 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:36666 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbfAaLLv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Jan 2019 06:11:51 -0500
Received: by mail-ua1-f66.google.com with SMTP id j3so888016uap.3;
        Thu, 31 Jan 2019 03:11:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y3/B/tYt2P0XRy8PGJMmeO6g2XSiK/MlR4W+q7ekSJ4=;
        b=ordHM2TJv9uVcsfTVt0GLO9D3UaQdSCz/MdzwNOSQc1OEkWyrHsLkkcbXOlpThwP20
         bX8YlEddkS3vzRXn2qmKkL5+ETBIwhCbiV0zjx9il1W+NX8onGYqfW43oq86wvkwG4cD
         WQt+DVhq9BYF80BVAboVeDw6/2I+H5XzW8ieR8VJ3TODqGvcCyf6GPWOIpgc6BZdhRNx
         RSv8stLQDCpMQaKVs6TECo2roFpsRUqcdiCCb4u/+wtrc+S6VoXroWXaeeN/vRgB7CPK
         geJdMCKN8yHW4bmcfc6oSt4ZNwB21xbBnNnw3SG4NWEzGaiGxensda3rTX/sMmS5f3F6
         qO7g==
X-Gm-Message-State: AJcUukdSUAmOKBmhPC2k0CVZOinBtChMnTtlwzNEbu4tbi4ir6FhZ/G/
        bWQcU8b9esIsIvTG8k9yXL3vq35qrk7KmNmDM8g=
X-Google-Smtp-Source: ALg8bN6qB6SxjB9syvivyJizejeFNcQeQjiJzjkl2txoebxb/PAAdeuKvxEt/zM1cZd6JSnttFDUU25mvimp/PQL8hU=
X-Received: by 2002:ab0:7251:: with SMTP id d17mr14627363uap.0.1548933110394;
 Thu, 31 Jan 2019 03:11:50 -0800 (PST)
MIME-Version: 1.0
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
 <e43f07fd-1407-a87a-7fe5-67a522da9e19@cogentembedded.com> <CAMuHMdUixqEcD36ReZj4noF5VOCNHS-qH_9herABkiLSVD3R8A@mail.gmail.com>
 <918892bc-4b2d-0235-cb51-749ca49bd4e8@cogentembedded.com>
In-Reply-To: <918892bc-4b2d-0235-cb51-749ca49bd4e8@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Jan 2019 12:11:38 +0100
Message-ID: <CAMuHMdWcgpW50m5p2dG74xV0L-toieU9_N7-JDkpatc=3ssJ_Q@mail.gmail.com>
Subject: Re: [PATCH 4/7] sh_eth: offload RX checksum on R8A7740
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     netdev <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On Thu, Jan 31, 2019 at 11:52 AM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 01/29/2019 09:20 PM, Geert Uytterhoeven wrote:
> >> The R-Mobile A1 (R8A7740) SoC manual describes the Ether MAC's RX checksum
> >> offload the same way as it's implemented in the EtherAVB MAC...
> >>
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >
> > Thanks for your patch!
> >
> > Running netperf as described in patch 2/7, perf tells me there's a reduction
> > for csum_partial from ca. 1.9% to 0.01%, so this feature seems to work.
>
>    Hm, what about do_csum()?

I had looked for that, but didn't see it. Probably inlined, as it's static.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
