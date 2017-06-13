Subject: Re: [GIT PULL FOR renesas-drivers] media: ADV748x driver
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Kieran Bingham <kbingham@kernel.org>
References: <1497314657-15984-1-git-send-email-kbingham@kernel.org>
 <CAMuHMdXCALSt68C6QM95Xb7_hjUBqg6op5+uBWyJVMAREfY0AQ@mail.gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <94f3eac8-4840-d027-d80b-cc95ca76c041@ideasonboard.com>
Date: Tue, 13 Jun 2017 10:06:06 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXCALSt68C6QM95Xb7_hjUBqg6op5+uBWyJVMAREfY0AQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 13/06/17 07:56, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Tue, Jun 13, 2017 at 2:44 AM, Kieran Bingham <kbingham@kernel.org> wrote:
>> Please consider including this driver (based on linux-media/master) for renesas-drivers.
> 
> Thanks, looks good!

Thanks,

DT updates are not included as it will have to be based on top of the DT for
rcar-vin which will need synchronising with Niklas, but we'll be working through
that soon :)

>> The following changes since commit 47f910f0e0deb880c2114811f7ea1ec115a19ee4:
>>
>>   [media] v4l: subdev: tolerate null in media_entity_to_v4l2_subdev (2017-06-08 16:55:25 -0300)
>>
>> are available in the git repository at:
>>
>>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/kbingham/rcar.git adv748x/for-renesas-drivers
> 
> BTW, most people prefer "git://git.kernel.org/..."

Ah yes, I keep getting caught up by this.

All I do is:

  git request-pull linux-media/master kernel.org adv748x/for-renesas-drivers
(or such), which is of course my URL for push access to kernel.org

How do you handle this? Do you have a separate remote for pull requests? or just
update the text manually?

--
Regards

Kieran

> 
>>
>> for you to fetch changes up to fdae35a2e755e7d2e06d652c2e64343b7f82fce1:
>>
>>   media: i2c: adv748x: add adv748x driver (2017-06-13 01:40:24 +0100)
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
