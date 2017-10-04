Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:33954 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752065AbdJDNu4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 09:50:56 -0400
Received: by mail-wr0-f194.google.com with SMTP id z1so7999733wre.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Oct 2017 06:50:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <e0366eaf-7163-0037-de60-833df0ade812@cogentembedded.com>
References: <87efqlou4w.wl%kuninori.morimoto.gx@renesas.com>
 <878tgtou1t.wl%kuninori.morimoto.gx@renesas.com> <e0366eaf-7163-0037-de60-833df0ade812@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Oct 2017 15:50:55 +0200
Message-ID: <CAMuHMdVa0u01Zqa10qJiDfDwZF+o_saVTJWEPtw5tNv-i-__yg@mail.gmail.com>
Subject: Re: [RFC][PATCH 4/4] pinctrl: sh-pfc: r8a77995: add Audio SSI pin support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei, Morimoto-san,

On Tue, Oct 3, 2017 at 11:36 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 10/3/2017 5:23 AM, Kuninori Morimoto wrote:
>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>
>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> ---
>>   drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 60
>> +++++++++++++++++++++++++++++++++++
>>   1 file changed, 60 insertions(+)
>>
>> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
>> b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
>> index 2b56253..1a5c5a7 100644
>> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
>> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
>> @@ -1232,6 +1232,50 @@ enum {
>>         SCIF_CLK_MARK,
>>   };
>>   +/* - SSI
>> ---------------------------------------------------------------*/
>> +static const unsigned int ssi3_data_pins[] = {
>> +       /* SDATA3 */
>> +       RCAR_GP_PIN(4, 3),
>> +};
>> +static const unsigned int ssi3_data_mux[] = {
>> +       SSI_SDATA3_MARK,
>> +};
>> +static const unsigned int ssi34_ctrl_pins[] = {
>> +       /* SCK34,  WS34 */
>> +       RCAR_GP_PIN(4, 2), RCAR_GP_PIN(4, 4),
>> +};
>> +static const unsigned int ssi34_ctrl_mux[] = {
>> +       SSI_SCK34_MARK, SSI_WS34_MARK,
>> +};
>> +static const unsigned int ssi4_ctrl_a_pins[] = {
>> +       /* SCK4_A, WS4_A */
>
>
>    Why these sudden A/B suffixes in the comments?
> We haven't had them yet, I think.

Indeed. Other drivers don't even have the numerical suffixes, except for
R-Car H2 and E2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
