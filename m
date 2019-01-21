Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CF5C7113B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:01:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 639AF20879
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:01:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sw+QA87t"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728258AbfAUMBp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 07:01:45 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41921 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728249AbfAUMBo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 07:01:44 -0500
Received: by mail-wr1-f68.google.com with SMTP id x10so22979632wrs.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jan 2019 04:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N3aeT3iLDUXhY3s8l6rMnlMcdLBCxhQgvjN8/8ifWa4=;
        b=sw+QA87tvnx7MNu+69ByiA184UiLaneVvoqbM1XMoF0wKdCQc3cFuNwUGdo5CZJQVf
         NaQ0E10uZEdVwEZMlQjgvLD99D8xqrxsFD3LrzeWktDLf+EA6maxeAGXRz4G5LMbIv4C
         ylwd990mXoC3SXZOi+jHZlV4CWwWsel0IQMvVCXWgFgy6MKuB56eE22Q163pmU5AhtX8
         3uEz7R7UuxC2AE0jycH7zBFBeckEDcTWy18bgO+pfFi/Ke+3vG6Ll9D9Ev4/v/jp05nB
         Di02zMaBu2pnTGjDIPoOO/NIpfxs9Aorhvkk8e0H+0gCgOLOYiTv40dT/5JgSamDeNxf
         ox3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N3aeT3iLDUXhY3s8l6rMnlMcdLBCxhQgvjN8/8ifWa4=;
        b=FZfcPfdVmrxr5JvlNiIX9FiQ0mEwVQ91+PshVnoXh/foditcI49HEyy7A7jA3wNhY7
         fkI4eCWs75BemLVwBOMq+JVZ0Xa7NLCjDA3Bu1KFZhddn2tzvtgGkbIYmN0pn1ezY6yC
         HpsqEvZ9csHrhebNvemi0boX34N9WkXvUdAJQeFJCZGTZX7tz/zC+90Do5WXurhPAgGu
         5nY02+6YBaFprknjJwuTpph/qp5fanVnKRiBdv/jHtm+W47Gx/e2rADWIC3Uydo3Bvnz
         UyCsZ9H7sQmMYXy2MUvWSCfDBm9boM9eMDuOFQRfkA0dvWzdbVfiMfHnvGdxkJCL/PQP
         063A==
X-Gm-Message-State: AJcUukfIJ6jyuxerlTITg7+HvBpj0+hPwkh39gfrTNFC6cAuk9SNALog
        ntzgRUUuPXc7liZCwRu25wfZuJBIDvMqjQou/H30yA==
X-Google-Smtp-Source: ALg8bN6byeYUsc0Lsln1wMxK2r3oE5Z7/agam1O097bcZsvTHZMlUilXKJraXFiVXUsBhf9/Orv3P0pN0+wrfh8ceEI=
X-Received: by 2002:adf:e3d0:: with SMTP id k16mr29056434wrm.223.1548072102931;
 Mon, 21 Jan 2019 04:01:42 -0800 (PST)
MIME-Version: 1.0
References: <154807139502.25511.1919986589060151108.sendpatchset@octo> <CAMuHMdUe+Hjn7cJB19OpEt7=Stcj-=gvA1TxH-fEjDpTx1PG1g@mail.gmail.com>
In-Reply-To: <CAMuHMdUe+Hjn7cJB19OpEt7=Stcj-=gvA1TxH-fEjDpTx1PG1g@mail.gmail.com>
From:   Magnus Damm <magnus.damm@gmail.com>
Date:   Mon, 21 Jan 2019 21:01:30 +0900
Message-ID: <CANqRtoTNk7MQuXmoEZ6aTbEbEEOg7t-B63USvjcxKs-7LWggSA@mail.gmail.com>
Subject: Re: [PATCH/RFC 00/02] Remove undocumented IMR-LX4 device nodes
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Konstantin Kozhevnikov 
        <Konstantin.Kozhevnikov@cogentembedded.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Jan 21, 2019 at 8:53 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Magnus,
>
> On Mon, Jan 21, 2019 at 12:49 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> > Remove undocumented IMR-LX4 device nodes
> >
> > [PATCH/RFC 01/02] arm64: dts: renesas: r8a7795: Remove IMR-LX4 device nodes
> > [PATCH/RFC 02/02] arm64: dts: renesas: r8a7796: Remove IMR-LX4 device nodes
> >
> > These patches take the easy way out and simply remove the undocumented
> > IMR-LX4 device nodes from the upstream tree. Good or bad, let me know!
> >
> > So perhaps this is a bit overly aggressive but since the DT bindings seem
> > undocumented and no driver exists in upstream my gut feeling says these DT
> > nodes were part of an upstreaming attempt that got suspended half-way through.
> >
> > In case DT binding documentation is in-flight and queued up somewhere
> > (ideally together with a driver) then feel free to ignore this series.
> >
> > Instead of removing nodes we could also document the DT bindings for the
> > IMR-LX4 devices. It would also make sense to add device nodes to other
> > more recent SoCs than just H3 and M3-W. But blindly adding more DT nodes
> > with a DT binding but without a driver seems a bit suboptimal compared to
> > testing against an actual driver.
>
> [PATCH v5] media: platform: Renesas IMR driver
> https://lore.kernel.org/linux-renesas-soc/20170309200818.786255823@cogentembedded.com/

Thanks, but that seems to be from 2017! =)

Cheers,

/ magnus
