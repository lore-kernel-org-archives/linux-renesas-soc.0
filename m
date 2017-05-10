Subject: Re: [GIT PULL FOR renesas-drivers] v4l: vsp1: writeback prototype
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <1494348424-18246-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
 <CAMuHMdVyCSgGZ1QcKaXeq6kjJBZJ8P4L0vmzDePk-o2HQwerXA@mail.gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <f84580b8-06b6-5476-51bf-b9ab76add982@ideasonboard.com>
Date: Wed, 10 May 2017 09:27:02 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVyCSgGZ1QcKaXeq6kjJBZJ8P4L0vmzDePk-o2HQwerXA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>



On 10/05/17 09:20, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Tue, May 9, 2017 at 6:47 PM, Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
>> The following changes since commit 13e0988140374123bead1dd27c287354cb95108e:
>>
>>   docs: complete bumping minimal GNU Make version to 3.81 (2017-05-06 18:49:09 -0700)
>>
>> are available in the git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/submissions/vsp1/writeback/v3
>>
>> for you to fetch changes up to 5debeb08338b520f52577ca6cf9be815a54c07ea:
>>
>>   v4l: vsp1: Provide a writeback video device (2017-05-08 15:06:58 +0100)
> 
> Looks good, and merges cleanly into today's linux-next.
> 
>> v3:
>>  - Rebased to v4.12-rc1
> 
> Interesting... Where can I find v4.12-rc1? ;-)
> 
> I see this is based on an arbitrary commit in Linus' tree instead?
> While that's OK for renesas-drivers, you never want to do this for a
> pull request you
> sent to an upstream maintainer.

Sorry - that was meant to say rebased in preparation for v4.12-rc1 ...

As are the others of course.
This was the point at which both DRM and V4L had been merged, and I was able to
rebase my work on top of those as a constant representative base.

If it's better I can resend pull requests after v4.12-rc1 is out ... but the
window between then, and your integration is only one day! so I've just been
sending these out as I've refreshed and tested them.

--
Kieran


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
