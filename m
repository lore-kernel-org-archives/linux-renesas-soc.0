Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB11657308A9FA6EF71F5F89688A9A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <SG2PR06MB1165A4A8A555A3176D0C4ED98A9A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdUJFSbX96pqY2Ogxztxz-SWCNfbe=d3eWKn+eWSdHLwfw@mail.gmail.com> <SG2PR06MB11657308A9FA6EF71F5F89688A9A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Dec 2016 19:57:58 +0100
Message-ID: <CAMuHMdVjHdquLp2fGbW2Q+pNKVyn3x5QF=KfdBiy5hLJXsz6oQ@mail.gmail.com>
Subject: Re: clk: clk-mstp has never worked for RZ/A1
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Wed, Dec 14, 2016 at 5:22 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Dec 14, 2016, Geert Uytterhoeven wrote:
>> Another option is to let the driver bind against "renesas,r7s72100-mstp-
>> clocks", and switch to 8-bit access mode.
>>
>> CLK_OF_DECLARE(cpg_mstp_clks, "renesas,r7s72100-mstp-clocks",
>> cpg_mstp_clocks_init8);
>>
>> cpg_mstp_clocks_init8() can set a gloal flag, and call
>> cpg_mstp_clocks_init().
>>
>> The latter means no DT update is needed, and thus preserves compatibility
>> with old DTBs.
>
> I just coded that and it works good. Thank you.

I'm glad to hear that!

> Now, one more question before I submit a patch for review:
>
> I would like to add a "Fixes:" to the commit log so it can be considered for 4.9-stable (in reality it could go all the way back to when r7s72100 support was added)
>
> But, the current file path didn't exist until after commit b3a33077c0dd ("clk: renesas: move drivers to renesas directory") on 2016-03-02.
>
> So should I use that commit for my 'Fixes'?

Please use the original commit, as that's where the bug was introduced.
Git is quiet good in tracking renames, so cherry-picking it to v4.5 and older
kernels may just work ;-)

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
