Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f182.google.com ([209.85.128.182]:46599 "EHLO
        mail-wr0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751870AbeDRJCS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 05:02:18 -0400
Received: by mail-wr0-f182.google.com with SMTP id d1-v6so2623479wrj.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Apr 2018 02:02:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXVz_CjdGtW4SYOUx7kMS-T1RadVzMQdqMktt2NXz6PnQ@mail.gmail.com>
References: <152404037580.7843.5140455339218102749.sendpatchset@little-apple>
 <152404040278.7843.524678765267319751.sendpatchset@little-apple> <CAMuHMdXVz_CjdGtW4SYOUx7kMS-T1RadVzMQdqMktt2NXz6PnQ@mail.gmail.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 18 Apr 2018 18:02:16 +0900
Message-ID: <CANqRtoST+UfQzTZs+QMpHXJEjPH+LaoqjhBEpeSd0q0QnsUHrA@mail.gmail.com>
Subject: Re: [PATCH 03/03] ARM: shmobile: stout: Initial support and regulator quirk
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Wed, Apr 18, 2018 at 5:55 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Magnus,
>
> On Wed, Apr 18, 2018 at 10:33 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> This is a back port to v4.16 of the following commits merged in v4.17-rc1:
>> ff938cd14d67 ARM: shmobile: stout: enable R-Car Gen2 regulator quirk
>> 92bcfdb334ca ARM: dts: stout: Initial r8a7790 Stout board support
>
> I think you also want
> 60fc75bdf5b1b8ed ("ARM: shmobile: rcar-gen2: Fix error check in
> regulator quirk")

Thanks - good point!

Cheers,

/ magnus
