Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:56581 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753130AbdIGI0w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Sep 2017 04:26:52 -0400
Subject: Re: [PATCH 1/8] spi: sh-msiof: Add sleep before master transfer for
 test
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
References: <20170906070507.26223-1-dirk.behme@de.bosch.com>
 <20170906070507.26223-2-dirk.behme@de.bosch.com>
 <CAMuHMdV5vQsS5RgykMptRxDb1wgS9YryBQu7xgGHXactjGGWFA@mail.gmail.com>
From: Dirk Behme <dirk.behme@de.bosch.com>
Message-ID: <1ae37860-9692-c749-f291-cee4a5d5d729@de.bosch.com>
Date: Thu, 7 Sep 2017 10:26:43 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV5vQsS5RgykMptRxDb1wgS9YryBQu7xgGHXactjGGWFA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07.09.2017 10:11, Geert Uytterhoeven wrote:
> Hi Dirk,
> 
> On Wed, Sep 6, 2017 at 9:05 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>>
>> This patch is for debug of transfer between master and slave.
>> Since the slave needs to complete a preparation in data transfer
>> before the master working, the sleep wait is put before
>> the data transfer of the master.
>>
>> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> 
> IMHO this is a pure debug patch, not intended for upstream.


Dropped for v2.


Thanks

Dirk
