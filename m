Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:45958 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750922AbeEUI6s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 04:58:48 -0400
Subject: Re: [PATCH 2/2] tests: suspend/resume: Increase number of processed
 frames
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
References: <20180519203426.25711-1-laurent.pinchart@ideasonboard.com>
 <20180519203426.25711-3-laurent.pinchart@ideasonboard.com>
 <9f68f70c-089f-58f9-1e30-3e53b85acca4@ideasonboard.com>
 <8256862.BA8i1yAIzy@avalon>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <fbfea959-69a9-b497-ede7-7ab0287eb957@ideasonboard.com>
Date: Mon, 21 May 2018 09:58:44 +0100
MIME-Version: 1.0
In-Reply-To: <8256862.BA8i1yAIzy@avalon>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="6rUZ4vkcqf7X2hmD21kOqV0PjDvYVZBlM"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6rUZ4vkcqf7X2hmD21kOqV0PjDvYVZBlM
Content-Type: multipart/mixed; boundary="JBRNSf38djzylQsnoLu3nPsUd6qk4ycZZ";
 protected-headers="v1"
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <fbfea959-69a9-b497-ede7-7ab0287eb957@ideasonboard.com>
Subject: Re: [PATCH 2/2] tests: suspend/resume: Increase number of processed
 frames
References: <20180519203426.25711-1-laurent.pinchart@ideasonboard.com>
 <20180519203426.25711-3-laurent.pinchart@ideasonboard.com>
 <9f68f70c-089f-58f9-1e30-3e53b85acca4@ideasonboard.com>
 <8256862.BA8i1yAIzy@avalon>
In-Reply-To: <8256862.BA8i1yAIzy@avalon>

--JBRNSf38djzylQsnoLu3nPsUd6qk4ycZZ
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 21/05/18 09:51, Laurent Pinchart wrote:
> Hi Kieran,
>=20
> On Monday, 21 May 2018 11:16:05 EEST Kieran Bingham wrote:
>> Hi Laurent,
>>
>> Thank you for the patch,
>>
>> On 19/05/18 21:34, Laurent Pinchart wrote:
>>> The suspend/resume test starts a run of 300 frames and suspends the
>>> system one second later. On some SoCs (namely H3 ES2.0) the VSP
>>> bandwidth is high enough to complete processing of 300 frames in less=

>>> than a second. The test thus suspends and resumes the system with the=

>>> VSP idle instead of running, defeating the purpose of the test.
>>>
>>> Fix this by increasing the number of frames to process to 1000. The
>>> frame count is now passed as an argument to the
>>> test_extended_wpf_packing function to ease future changes.
>>
>> Great idea, to make it easy to update and re-use.
>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>>> ---
>>>
>>>  tests/vsp-unit-test-0020.sh | 15 ++++++++-------
>>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/tests/vsp-unit-test-0020.sh b/tests/vsp-unit-test-0020.s=
h
>>> index 91f6b167f22e..950c1bebbf2f 100755
>>> --- a/tests/vsp-unit-test-0020.sh
>>> +++ b/tests/vsp-unit-test-0020.sh
>>> @@ -15,25 +15,26 @@ features=3D"rpf.0 wpf.0"
>>>
>>>  # These can be extracted from /sys/power/pm_test
>>>  suspend_modes=3D"freezer devices platform processors core"
>>>
>>> -# This extended function performs the same
>>> -# as it's non-extended name-sake - but runs the pipeline
>>> -# for 300 frames. The suspend action occurs between frame #150~#200
>>> -
>>> +# This extended function performs the same as it's non-extended
>>> name-sake, but
>>> +# runs the pipeline for a configurable number of frames.
>>>
>>>  test_extended_wpf_packing() {
>>>  	local format=3D$1
>>> +	local num_frames=3D$2
>>>
>>>  	pipe_configure rpf-wpf 0 0
>>>  	format_configure rpf-wpf 0 0 ARGB32 1024x768 $format
>>>
>>> -	vsp_runner rpf.0 --count=3D300 &
>>> -	vsp_runner wpf.0 --count=3D300 --skip=3D297
>>> +	vsp_runner rpf.0 --count=3D$num_frames &
>>> +	vsp_runner wpf.0 --count=3D$num_frames --skip=3D$((num_frames-1))
>>
>> The original test compared up to 3 frames... But I guess as long as on=
e
>> frame matches we're good on this test. We just need to know the pipeli=
ne
>> was still running... and 3 frames doesn't provide much more informatio=
n
>> than one.
>=20
> That's an oversight. num_frames-3 is what I meant.=20
>=20
>>>  	local result=3D$(compare_frames)
>>>  	[ x$result =3D=3D xpass ] && return 0 || return 1
>>> =20
>>>  }
>>> =20
>>>  test_hw_pipe() {
>>>
>>> -	test_extended_wpf_packing RGB24
>>> +	# Run the pipeline for 1000 frames. The suspend action occurs betwe=
en
>>> +	# frame #500~#600
>>
>> I'm not sure it's worth stating when the suspend action occurs, as it'=
s
>> variable depending upon the performance of the SoC ... but I'll not ob=
ject
>> to this.
>=20
> I agree with you, I'll remove that.
>=20
> I think it would make sense to run the pipeline without a limit in the =
frame=20
> count, and stop streaming after resume. Feel free to give it a try if y=
ou want=20
> :-)

The question here will be how to we get the frame verification to occur o=
n the
'last N frames'

For this, wouldn't we need to extend yavta to support some kind of signal=
 to
perform a stream validation at an earlier point and shutdown the stream
(probably leaving the count/skip, as maximum durations to run...) And the=
n
making sure we knew which frames were actually written out ...

I'll leave this ticking in the back of my mind for now :D

>=20
>>> +	test_extended_wpf_packing RGB24 1000
>>>  }
>>> =20
>>>  test_suspend_resume() {
>=20


--JBRNSf38djzylQsnoLu3nPsUd6qk4ycZZ--

--6rUZ4vkcqf7X2hmD21kOqV0PjDvYVZBlM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEkC3XmD+9KP3jctR6oR5GchCkYf0FAlsCikQACgkQoR5GchCk
Yf2HRxAAmNYLFxT9OZyro+oYrB/voXUCF7fbVQvtABlm0rzQSvGhF12Yf4mQvclv
wqfJ/R9YHNlytqJTj7nW+GcfGx6UaBMo98C2tak7Z+Qz825sWH6FQoA5q8lxz9Zo
DEzAQT+tSYtyiFGVcR30sLJ/e7kGdNZNK364IH+lHwA/d0dscMRb/uReumPaQmgE
0+UOnZtUc3F2Y+o/SBdvdIYIziwFdc7VHFyo2c1H6hErgUEIV3JL9YmWnjE5KN14
5YLXMSFMsPnbK/sejr+XGdCyBEXBCDaYiDMZHEUGWUuLMydbk17mc7AFpkntMve1
XZs6qY7K+ppG/deqUCH+9U3NmIa+qXHVrbPU4HqqwZ2+2HGM3iTrWPY1CNB6jzaG
PauR6XktFjH3UUEL2lwVZUUmWUA7RVcQNrHw2KuCVZSd1LE/dWM9mxn79SfmPnqU
zTtN8SxvhJwRTQF7TPXCFCkavJzwANbzDB9Ud0/8qbWkSyIY0bY4Oh7She/VYPWr
FUOCWV54spZpY6ajZluu5FZMr+wJzzO0sjlBLfYFwSWw2IHy2dLMPre4OCvx/W+0
TLxej1FKclBEhgiW+0h/Kpd2kmeJd63kQFBFI7Lj1Edy9oiUo8/xG+dqIA1DspC3
7OdAvBLxq396tgs2yZud7b398lMzNx2SwMFCDcucb/NkFi0qiUU=
=DYgN
-----END PGP SIGNATURE-----

--6rUZ4vkcqf7X2hmD21kOqV0PjDvYVZBlM--
