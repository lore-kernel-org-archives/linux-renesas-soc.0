Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:44918 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751081AbeAYIam (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jan 2018 03:30:42 -0500
Subject: Re: [RFC PATCH v2 1/1] of: introduce event tracepoints for dynamic
 device_node lifecyle
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20180121143117.19805-1-wsa+renesas@sang-engineering.com>
 <20180121143117.19805-2-wsa+renesas@sang-engineering.com>
 <4cc627c4-1aaf-b8d5-5a26-eea7e596743f@gmail.com>
 <CAMuHMdVuN5iRLqWuPH_UVR1zDJK-rPHZ6guU-ssPuoZ=UWTAFw@mail.gmail.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <ba2b76ee-f048-496c-eb3a-b9060b6701b7@gmail.com>
Date: Thu, 25 Jan 2018 00:30:39 -0800
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVuN5iRLqWuPH_UVR1zDJK-rPHZ6guU-ssPuoZ=UWTAFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/25/18 00:01, Geert Uytterhoeven wrote:
> Hi Frank,
> 
> On Thu, Jan 25, 2018 at 7:48 AM, Frank Rowand <frowand.list@gmail.com> wrote:
>>>  create mode 100644 include/trace/events/of.h
>>
>> mode looks incorrect.  Existing files in include/trace/events/ are -rw-rw----
> 
> Not in my git clone ;-) 644 should be fine.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert

Thanks!!!  I just learned something new about git.  Now I have to go experiment
a bit to make sure I learned properly.

-Frank
