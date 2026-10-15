import { useState } from 'react';

import { useBackend } from '../backend';
import { Section, TextArea } from '../components';
import { NtosWindow } from '../layouts';

type Data = {
  note: string;
};

export const NtosNotepad = (props) => {
  const { act, data } = useBackend<Data>();
  const [note, setNote] = useState(data.note);

  return (
    <NtosWindow width={400} height={480}>
      <NtosWindow.Content>
        <Section fill title="Notepad">
          <TextArea
            fluid
            height="100%"
            value={note}
            maxLength={4096}
            onInput={(_, value) => setNote(value)}
            onChange={(_, value) => act('UpdateNote', { newnote: value })}
          />
        </Section>
      </NtosWindow.Content>
    </NtosWindow>
  );
};
