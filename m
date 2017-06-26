Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:36287 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751353AbdFZJbm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jun 2017 05:31:42 -0400
Received: by mail-it0-f51.google.com with SMTP id m68so14406910ith.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jun 2017 02:31:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170626092047.GI30481@bigcity.dyn.berto.se>
References: <1497471834-917-1-git-send-email-kbingham@kernel.org>
 <1497471834-917-2-git-send-email-kbingham@kernel.org> <CAMuHMdUNaZVCnYjnoDXZEyNa3Y8ukUjqnx6nBgeOK+0qmJT0CA@mail.gmail.com>
 <0c7174d2-36d0-89a5-eb85-947c800bd229@ideasonboard.com> <20170626092047.GI30481@bigcity.dyn.berto.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jun 2017 11:31:40 +0200
Message-ID: <CAMuHMdWkWsq76grVW+F74RPLcymYqX7iH=DpsMwBcb=j1D32fg@mail.gmail.com>
Subject: Re: [GIT PULL for renesas-drivers] ADV748x v5 device-tree.
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas, Kieran,

On Mon, Jun 26, 2017 at 11:20 AM, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2017-06-16 11:30:23 +0100, Kieran Bingham wrote:
>> On 16/06/17 09:57, Geert Uytterhoeven wrote:
> > On Wed, Jun 14, 2017 at 10:23 PM, Kieran Bingham <kbingham@kernel.org> =
wrote:
>> >> Please consider this pull request for the next renesas-drivers releas=
e.
>> >>
>> >> This DT update is based on Simon's horms/next branch, but is also dep=
endant
>> >> upon Niklas' VIN driver DT nodes being integrated.
>> >
>> > That means "make dtbs" doesn't work in this branch?
>> > I think you need to sync with Niklas, so you can build your branch on
>> > top of his.
>>
>> Yes, that's why I tried to make that clear in the PR. sorry - as stupid =
as it
>> was to send as is, - it is dependant upon Niklas' non-mainlined patches,=
 and I
>> had to post a pull request for my report for yesterday.
>>
>> Sorry for the red-tape induced noise :(
>>
>> Niklas has now made his updated DT branch available to me, so I expect t=
o have
>> sent an update before your next renesas-drivers anyway - Although Niklas=
, your
>> rcar-vin-dt branch contains an unrelated [LOCAL] patch to defconfig. So =
I still
>> can't base my dt patch on your dt-branch.
>
> I never intended the rcar-vin-dt branch to be submitted for
> renesas-drivers (at lest not until the DT bindings where Acked). So I
> intentionally  left the [LOCAL] patch in that branch, but I agree the
> naming is confusing in regard to that...
>
>> How should we handle this going forwards?.
>
> If we want to include the DT changes in renesas-driver I be happy to
> remove the [LOCAL] patch and pay more attention to details for that
> branch and include it in my for-renesas-branch.
>
> Geert what do you think? Do you think it's a good idea for me and Kieran
> to start including the DT updates for VIN in our submissions for
> renesas-drivers? If so I would like to request a quick sanity check of
> my rcar-vin-dt as I'm not sure I fully got the hang of the new DT file
> structure and I don't want to break things :-)

If the consumers of renesas-drivers have a benefit due to including the DT
changes, I think they should be included.
How else can they use the new drivers and driver updates you're providing?

>> I can't really base my DT branch on Niklas' as he is in concurrent activ=
e
>> development.
>>
>> Should I pass my DT patch on to you Niklas and consider you 'upstream' f=
or that
>> patch? (at least in regards to renesas-drivers)
>
> If you like I have no problem to carry that patch in my rcar-vin-dt
> branch. Let me know what you wish me to do.

Either Niklas can include Kieran's patch, or Niklas can public his branch,
and Kieran can base his on top of Niklas'.
Which is most convenient for you is up to you.

I expect the DT additions won't change once the DT bindings have been
agreed upon?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
