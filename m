Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot0-f171.google.com ([74.125.82.171]:45209 "EHLO
        mail-ot0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752494AbeBEMnZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 07:43:25 -0500
MIME-Version: 1.0
In-Reply-To: <1ca78555-fea3-3fea-090d-66dca48dc4ea@cogentembedded.com>
References: <1517771931-17157-1-git-send-email-ykaneko0929@gmail.com> <1ca78555-fea3-3fea-090d-66dca48dc4ea@cogentembedded.com>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date: Mon, 5 Feb 2018 21:43:23 +0900
Message-ID: <CAH1o70J63hXEgj_U6dKOzX+uXjEcd2cn4JvBKr_dBrgvGgFwBQ@mail.gmail.com>
Subject: Re: [PATCH/RFT v3] sata_rcar: Reset SATA PHY when Salvator-X board resumes
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-ide@vger.kernel.org, Tejun Heo <tj@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

2018-02-05 17:33 GMT+09:00 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>:
> Hello!
>
> On 2/4/2018 10:18 PM, Yoshihiro Kaneko wrote:
>
>> From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
>>
>> Because power of Salvator-X board is cut off in suspend,
>> it needs to reset SATA PHY state in resume.
>> Otherwise, SATA partition could not be accessed anymore.
>>
>> Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
>> Signed-off-by: Hien Dang <hien.dang.eb@rvc.renesas.com>
>> [reinit phy in sata_rcar_resume() function on R-Car Gen3 only]
>> [factor out SATA module init sequence]
>> [fixed the prefix for the subject]
>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>
> [...]
>
>    OK, this one seems better.

Thank you as always for your help.

Best regards,
Kaneko

>
> MBR, Sergei
