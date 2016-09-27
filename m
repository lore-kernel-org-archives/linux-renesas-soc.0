Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f172.google.com ([209.85.217.172]:34202 "EHLO
        mail-ua0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752345AbcI0Gnb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Sep 2016 02:43:31 -0400
Received: by mail-ua0-f172.google.com with SMTP id u68so3332309uau.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2016 23:43:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160927062018.GD16263@bigcity.dyn.berto.se>
References: <20160920115433.14772.84308.sendpatchset@little-apple> <20160927062018.GD16263@bigcity.dyn.berto.se>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Tue, 27 Sep 2016 15:43:30 +0900
Message-ID: <CANqRtoS_ZDzjz0qpKO0sep-gypvOVKkUFkB+8tsZeqphsMwwNQ@mail.gmail.com>
Subject: Re: [PATCH/RFC] iommu/ipmmu-vmsa: IPMMU SYS-DMAC iova mapping workaround
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Tue, Sep 27, 2016 at 3:20 PM, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> Hi Magnus,
>
> On 2016-09-20 20:54:33 +0900, Magnus Damm wrote:
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> Here's some prototype code that works around the lack of software
>> support for mapping I/O devices to the SYS-DMAC hardware via the
>> DMA Engine framework when using IOMMU.
>>
>> The code itself is one big layering violation that goes through
>> the DT and unconditionally maps I/O devices using DMACs via the
>> IPMMU device instance into iova space with a 1:1 mapping.
>>
>> This very short term prototype will for instance automatically make
>> the SCIF serial port function with the IPMMU hardware in case the
>> SYS-DMAC is hooked up to the IPMMU device.
>>
>> Not to be confused with the more long term solution to allow the
>> DMA Engine framework to map I/O device memory dynamically.
>
> Good news, Vinod queued the dma_{map,unmap}_resource API and rcar-dmac
> usage of it yesterday \o/.

Excellent. Are the DMA Engine slave devices supposed to work out of
the box with the IPMMU then, or is some other component missing?

Cheers,

/ magnus
