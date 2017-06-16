Subject: Re: [GIT PULL for renesas-drivers] ADV748x v5 device-tree.
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <1497471834-917-1-git-send-email-kbingham@kernel.org>
 <1497471834-917-2-git-send-email-kbingham@kernel.org>
 <CAMuHMdUNaZVCnYjnoDXZEyNa3Y8ukUjqnx6nBgeOK+0qmJT0CA@mail.gmail.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <0c7174d2-36d0-89a5-eb85-947c800bd229@ideasonboard.com>
Date: Fri, 16 Jun 2017 11:30:23 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUNaZVCnYjnoDXZEyNa3Y8ukUjqnx6nBgeOK+0qmJT0CA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert, Niklas,

On 16/06/17 09:57, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Wed, Jun 14, 2017 at 10:23 PM, Kieran Bingham <kbingham@kernel.org> wrote:
>> Please consider this pull request for the next renesas-drivers release.
>>
>> This DT update is based on Simon's horms/next branch, but is also dependant
>> upon Niklas' VIN driver DT nodes being integrated.
> 
> That means "make dtbs" doesn't work in this branch?
> I think you need to sync with Niklas, so you can build your branch on
> top of his.

Yes, that's why I tried to make that clear in the PR. sorry - as stupid as it
was to send as is, - it is dependant upon Niklas' non-mainlined patches, and I
had to post a pull request for my report for yesterday.

Sorry for the red-tape induced noise :(

Niklas has now made his updated DT branch available to me, so I expect to have
sent an update before your next renesas-drivers anyway - Although Niklas, your
rcar-vin-dt branch contains an unrelated [LOCAL] patch to defconfig. So I still
can't base my dt patch on your dt-branch.

How should we handle this going forwards?.

I can't really base my DT branch on Niklas' as he is in concurrent active
development.

Should I pass my DT patch on to you Niklas and consider you 'upstream' for that
patch? (at least in regards to renesas-drivers)

Then we can keep those related changes in one branch. If and when updates happen
on my patch I can just submit them to you to update on your branch. Then we have
a single unified place for the inherently co-dependant DT patches for VIN and
ADV748x.

If the VIN patches make it upstream before ADV748x bindings are reviewed and
accepted, then I can take this patch back, as at that point I can base on your
upstreamed versions.

--
Kieran



> 
>> The following changes since commit ab4321dedd764fb6d8fad3463a93b491aabe669d:
>>
>>   Merge branches 'arm64-dt-for-v4.13', 'drivers-for-v4.13' and 'soc-for-v4.13' into next (2017-06-14 11:05:24 +0200)
>>
>> are available in the git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git adv748x/dt
>>
>> for you to fetch changes up to eb130d9433e9cd5b6b0f33715df18697460012ee:
>>
>>   arm64: dts: renesas: salvator-x: Add ADV7482 support (2017-06-14 15:46:42 +0100)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
